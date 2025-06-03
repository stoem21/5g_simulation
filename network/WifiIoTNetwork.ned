//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

//package NR.networks;
package simu5g.simulations.NR.networks;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.ethernet.Eth100M;
import inet.node.inet.SensorNode;
import inet.node.inet.StandardHost;
import inet.node.inet.WirelessHost;
import inet.node.wireless.AccessPoint;
import inet.physicallayer.wireless.apsk.packetlevel.ApskScalarRadioMedium;
import inet.physicallayer.wireless.ieee802154.bitlevel.Ieee802154UwbIrRadioMedium;
import inet.physicallayer.wireless.ieee802154.packetlevel.Ieee802154NarrowbandScalarRadioMedium;
import inet.physicallayer.wireless.ieee80211.packetlevel.Ieee80211ScalarRadioMedium;
import inet.visualizer.common.IntegratedMultiVisualizer;
import inet.visualizer.common.IntegratedVisualizer;

//
// TODO auto-generated type
//
network WifiIoTNetwork
{
    parameters:
        int numIoT = default(2);
    //@display("i=block/network2;bgb=1000,1000;bgi=background/pisa");
    //@display("bgb=881.51196,736.936");
    submodules:
        configurator: Ipv4NetworkConfigurator {
            @display("p=18,0.75");
        }
        radioMedium: Ieee80211ScalarRadioMedium {
            @display("p=18,2.25");
        }
        visualizer: IntegratedMultiVisualizer {
            @display("p=18,3.75");
        }
    	//server: StandardHost {
    	//	@display("p=100,200");
    	//}

        server: StandardHost {
            @display("p=155,81");
        }

        iotDevice[numIoT]: WirelessHost {
            @display("p=301,201;i=misc/sensor");
        }
        ap: AccessPoint {
            parameters:
                @display("p=155,185");
        }
    connections allowunconnected:
        // wired backhaul between AP and server
        ap.ethg++ <--> Eth100M <--> server.ethg++;
}


