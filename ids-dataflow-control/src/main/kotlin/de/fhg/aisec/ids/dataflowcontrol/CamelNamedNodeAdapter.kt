package de.fhg.aisec.ids.dataflowcontrol

import de.fhg.aisec.dataflowcontrol.communicationmethod.NodeInterface
import de.fraunhofer.iais.eis.Named
import org.apache.camel.Exchange
import org.apache.camel.NamedNode

class CamelNamedNodeAdapter(private val camelNamedNode: NamedNode) : NodeInterface {
    override val endpointUri: String
        get() = TODO("Not yet implemented")

    override fun toString(): String {
        return camelNamedNode.toString()
    }
    fun getCamelNamedNode(): NamedNode {
        return camelNamedNode
    }
}
