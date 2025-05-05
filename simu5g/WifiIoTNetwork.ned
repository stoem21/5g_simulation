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

package simu5g.nodes;
import inet.node.wireless.AccessPoint;
import inet.node.inet.WirelessHost;
import inet.node.inet.StandardHost;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.ethernet.Eth1G;
import inet.physicallayer.wireless.ieee80211.packetlevel.Ieee80211ScalarRadioMedium;
//import inet.physicallayer.wireless.common.medium.RadioMedium;
//import inet.physicallayer.wireless.ieee80211.packetlevel.Ieee80211RadioMedium;
//
// TODO auto-generated type
//
network WifiNetwork
{
    parameters:
        int numIoT = default(2);
        //@display("i=block/network2;bgb=1000,1000;bgi=background/pisa");
    submodules:
        radioMedium: Ieee80211ScalarRadioMedium {
            @display("p=100,100");
        }
        
        configurator: Ipv4NetworkConfigurator {
            @display("p=100,50");
        }

        server: StandardHost {
            @display("p=100,200");
        }

        wifiAp: AccessPoint {
            @display("p=300,200");
        }

        iotDevice[numIoT]: WirelessHost {
            @display("p=448,263;;i=misc/sensor");
        }
    connections allowunconnected:
        server.ethg++ <--> Eth1G <--> wifiAp.ethg++;
}

