package de.fhg.aisec.ids.dataflowcontrol

import de.fhg.aisec.dataflowcontrol.PolicyEnforcementPoint
import de.fhg.aisec.dataflowcontrol.communicationmethod.ExchangeInterface
import de.fhg.aisec.dataflowcontrol.communicationmethod.NodeInterface
import org.apache.camel.AsyncCallback
import org.apache.camel.Exchange
import org.apache.camel.Processor
import org.apache.camel.model.EndpointRequiredDefinition
import org.apache.camel.model.RouteDefinition
import org.apache.camel.model.ToDefinition
import org.apache.camel.support.processor.DelegateAsyncProcessor

class PolicyEnforcementPoint(destinationNode: NodeInterface, target: Processor) : PolicyEnforcementPoint(destinationNode) {
    val delegateProcessor: DelegateAsyncProcessor = object : DelegateAsyncProcessor(target) {
        @Throws(Exception::class)
        override fun process(
            exchange: Exchange,
            asyncCallback: AsyncCallback
        ): Boolean {
            if (processFlowControl(CamelExchangeAdapter(exchange)))
                return super.process(exchange, asyncCallback)
            else {
                throw Exception("Exchange blocked by data flow policy")
            }
        }
    }

    /*
     val delegateProcessor: DelegateAsyncProcessor = object : DelegateAsyncProcessor(target) {
        @Throws(Exception::class)
        override fun process(
            exchange: Exchange,
            asyncCallback: AsyncCallback
        ): Boolean {
            if (processFlowControl(object : CamelExchangeAdapter(exchange) {
                    override fun saveException(e: Exception) {
                        exchange.setException(e)
                    }
                })) {
                return super.process(exchange, asyncCallback)
            } else {
                throw Exception("Exchange blocked by data flow policy")
            }
        }

     */

    override fun findSource(destination: NodeInterface): NodeInterface {
        if (destination is CamelNamedNodeAdapter) {
            // If there is no previously saved node for this exchange, use the parent
            // <route> to find the input
            // (first <from> statement) of the processed route.
            var routeNode = destination.getCamelNamedNode().parent
            while (routeNode !is RouteDefinition) {
                routeNode = routeNode.parent
            }
            return CamelNamedNodeAdapter(routeNode.input)
        } else {
            throw IllegalArgumentException("Destination must be a CamelNamedNodeAdapter")
        }
    }

    override fun sendingData(destinationNode: NodeInterface): Boolean {
        // (destinationNode is ToDefinition)
        return if (destinationNode is CamelNamedNodeAdapter) {
            destinationNode.getCamelNamedNode() is ToDefinition
        } else {
            false
        }
    }


    override fun takeAction(sourceNode: NodeInterface?, destinationNode: NodeInterface): Boolean {
        //sourceNode is EndpointRequiredDefinition || destinationNode is ToDefinition
        return if (sourceNode is CamelNamedNodeAdapter && destinationNode is CamelNamedNodeAdapter) {
            sourceNode.getCamelNamedNode() is EndpointRequiredDefinition || destinationNode.getCamelNamedNode() is ToDefinition
        } else {
            false
        }
    }
}


