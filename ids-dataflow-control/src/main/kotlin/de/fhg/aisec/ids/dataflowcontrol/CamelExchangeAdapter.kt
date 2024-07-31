package de.fhg.aisec.ids.dataflowcontrol

import de.fhg.aisec.dataflowcontrol.communicationmethod.ExchangeInterface
import org.apache.camel.Exchange

open class CamelExchangeAdapter(private val camelExchange: Exchange) : ExchangeInterface {

    override fun saveException(e: Exception) {
        camelExchange.setException(e)
    }

    fun getCamelExchange(): Exchange {
        return camelExchange
    }
}
