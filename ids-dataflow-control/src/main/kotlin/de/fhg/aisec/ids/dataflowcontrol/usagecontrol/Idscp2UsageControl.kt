package de.fhg.aisec.ids.dataflowcontrol.usagecontrol

import com.google.common.collect.MapMaker
import de.fhg.aisec.dataflowcontrol.Idscp2UsageControlInterface
import de.fhg.aisec.dataflowcontrol.communicationmethod.ExchangeInterface
import de.fhg.aisec.ids.dataflowcontrol.CamelExchangeAdapter
import de.fraunhofer.iais.eis.ContractAgreement
import de.fhg.aisec.ids.camel.processors.UsageControlMaps // dependency to trusted connector to use UsageControlMaps
import java.net.URI

class Idscp2UsageControl : Idscp2UsageControlInterface {
    override fun getExchangeContract(exchangeInterface: ExchangeInterface): ContractAgreement? {
        if (exchangeInterface is CamelExchangeAdapter) {
            UsageControlMaps.getExchangeContract(exchangeInterface.getCamelExchange())
        } else {
            throw IllegalArgumentException("Invalid type, expected CamelExchangeInterface!")
        }
        return null //????? Why do I even need this
    }

    override fun isProtected(exchangeInterface: ExchangeInterface) = protectedBodies.containsKey(exchangeInterface)

    override fun protectBody(exchangeInterface: ExchangeInterface, contractUri: URI) {
        if (exchangeInterface is CamelExchangeAdapter) {
            protectedBodies[exchangeInterface] = exchangeInterface.getCamelExchange().message.body
            exchangeInterface.getCamelExchange().message.body = "### Usage control protected body, contract $contractUri ###"
        } else {
            throw IllegalArgumentException("Invalid type, expected CamelExchangeInterface!")
        }
    }

    override fun unprotectBody(exchangeInterface: ExchangeInterface) {
        if (exchangeInterface is CamelExchangeAdapter) {
            exchangeInterface.getCamelExchange().message.body = protectedBodies[exchangeInterface]
            protectedBodies -= exchangeInterface
        } else {
            throw IllegalArgumentException("Invalid type, expected CamelExchangeInterface!")
        }
    }

    companion object {
        private val protectedBodies: MutableMap<ExchangeInterface, Any> =
            MapMaker().weakKeys().makeMap()
    }
}
