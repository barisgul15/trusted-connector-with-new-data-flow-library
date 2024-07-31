/*-
 * ========================LICENSE_START=================================
 * ids-dataflow-control
 * %%
 * Copyright (C) 2019 Fraunhofer AISEC
 * %%
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * =========================LICENSE_END==================================
 */
package de.fhg.aisec.ids.dataflowcontrol

import de.fhg.aisec.dataflowcontrol.Idscp2UsageControlInterface
import de.fhg.aisec.dataflowcontrol.Interceptor
import de.fhg.aisec.dataflowcontrol.PolicyDecisionPoint
import de.fhg.aisec.dataflowcontrol.RouteManagerInterface
import de.fhg.aisec.dataflowcontrol.policy.PDP
import de.fhg.aisec.ids.api.router.RouteManager
import de.fhg.aisec.ids.dataflowcontrol.usagecontrol.ContainerManager
import de.fhg.aisec.ids.dataflowcontrol.usagecontrol.Idscp2UsageControl
import org.apache.camel.CamelContext
import org.apache.camel.NamedNode
import org.apache.camel.Processor
import org.apache.camel.spi.InterceptStrategy
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Component

@Component
class CamelInterceptor : InterceptStrategy, Interceptor {
    @Autowired
    private lateinit var rm: RouteManager
    override var pdp: PDP? = PolicyDecisionPoint(object : RouteManagerInterface {
        override fun getRouteAsProlog(routeId: String) = rm.getRouteAsProlog(routeId)
    })
    override var usageControlInterface: Idscp2UsageControlInterface? = Idscp2UsageControl()
    override var containerManager: ContainerManager? = ContainerManager()

    override fun wrapProcessorInInterceptors(
        context: CamelContext,
        node: NamedNode,
        target: Processor,
        nextTarget: Processor?
    ): Processor = PolicyEnforcementPoint(CamelNamedNodeAdapter(node), target).delegateProcessor

    companion object InterceptorInitializer {
        init {
            Interceptor.initialize(CamelInterceptor())
        }
    }
}
