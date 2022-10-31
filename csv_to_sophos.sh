#!/bin/bash

#EagleOne42
#2022-10-31
#csv_to_sophos.sh
#Version 0.1

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
echo "<Configuration APIVersion=\"1605.1\">"
echo "<DHCPServer transactionid=\"\">"
echo "    <Name>Default_DHCP_Server</Name>"
echo "    <Interface>Port1</Interface>"
echo "    <IPLease>"
echo "      <IP>a.b.c.d-w.x.y.z</IP>"
echo "    </IPLease>"
echo "    <StaticLease>"
grep -v "^0,\|,0,\|,0$" IP\ Reservations.csv | awk '{FS=","} ; {print "      <Lease>\n        <HostName>"$2"</HostName>\n        <MACAddress>"$3"</MACAddress>\n        <IPAddress>a.b.c."$1"</IPAddress>\n      </Lease>"}'
# | sed 's/"//g' | sed 1,4d
echo "    </StaticLease>"
echo "    <ConflictDetection>Enable</ConflictDetection>"
echo "    <SubnetMask>255.255.255.0</SubnetMask>"
echo "    <DomainName></DomainName>"
echo "    <DefaultLeaseTime>1440</DefaultLeaseTime>"
echo "    <MaxLeaseTime>2880</MaxLeaseTime>"
echo "    <UseApplianceDNSSettings>Enable</UseApplianceDNSSettings>"
echo "    <PrimaryDNSServer>a.b.c.d</PrimaryDNSServer>"
echo "    <SecondaryDNSServer>a.b.c.d</SecondaryDNSServer>"
echo "    <PrimaryWINSServer/>"
echo "    <SecondaryWINSServer/>"
echo "    <Gateway>a.b.c.d</Gateway>"
echo "    <UseInterfaceIPasGateway>UseInterfaceIPAsGateway</UseInterfaceIPasGateway>"
echo "  </DHCPServer>"
echo "</Configuration>"
