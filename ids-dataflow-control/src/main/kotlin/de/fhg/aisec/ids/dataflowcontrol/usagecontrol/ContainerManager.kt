package de.fhg.aisec.ids.dataflowcontrol.usagecontrol

import de.fhg.aisec.dataflowcontrol.usagecontrol.ApplicationContainer
import de.fhg.aisec.dataflowcontrol.usagecontrol.ContainerManagerInterface

class ContainerManager : ContainerManagerInterface {
    // implemented the DummyCM's list method, may be changed to other two for testing purposes if it works better.
    override fun list(onlyRunning: Boolean): List<ApplicationContainer> = ArrayList()
}
