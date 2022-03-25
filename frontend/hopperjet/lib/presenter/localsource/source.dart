//App Name
const Appname = "HopperJet";
const AppFunction = "The Network Reconnaissance Tool";
const Adv1 = "Easy";
const Adv2 = "Fast";
const Adv3 = "Robust";
//Pre-Installation Requirements
const Requirements = """Pre Installation Requirements:\n
make sure that you have the python version above 3.0\n
the latest version of git installed in your system.\n
The latest version of nmap is installed in your system""";
const Proceed = "Proceed with Installations...";

//Appbar
const support = "Support";

// Features
const Feature1 = "Host Detection";
const Feature2 = "Promiscous Detection";
const Feature3 = "ARP Spoof Detection";
const Feature4 = "IP Spoof Detection";
const Feature5 = "DNS Spoof Detection";
const Feature6 = "DHCP Spoof Detection";

const Feature7 = "Port Scanner";
const Feature8 = "OS Detection";
// theories for the features
const F1theory =
    "One of the very first steps in any network reconnaissance mission is to reduce a (sometimes huge) \nset of IP ranges into a list of active or interesting hosts.\n Scanning every port of every single IP address is slow and usually unnecessary. ";
const F2theory =
    "Promiscuous mode is a type of computer networking operational mode in which all network data packets \ncan be accessed and viewed by all network adapters operating in this mode. \n Promiscuous mode is used to monitor(sniff) network traffic. However, experienced sniffers can prevent this \n(e.g., using carefully designed firewall settings). Our objective is to detect those anomalies operating in the network.";
const F3theory =
    "ARP spoofing is a type of attack in which a malicious actor sends falsified ARP (Address Resolution Protocol)\n messages over a local area network. This results in the linking of an attacker's MAC address with the IP address of a legitimate computer or server on the network. This is a type \nof Man-in-the-Middle (MITM) attack. It can also be used for DNS Spoofing attack.";
const F4theory =
    "A hacker uses tools to modify the source address in the packet header to make the receiving computer\n system think the packet is from a trusted source, such as another computer on a legitimate network, and accept it. \nIt is a technique often used by bad actors to invoke DDoS attacks against a target device or the surrounding infrastructure.\n Because this occurs at the network level, there are no external signs of tampering.";
const F5theory =
    "Domain Name Server (DNS) Spoofing is a cyber attack that tricks your computer into thinking it's going to the \ncorrect website, but it's not. Attackers use DNS cache poisoning to hijack internet traffic and steal user credentials or personal data";
const F6theory =
    "DHCP starvation attack is an attack that targets DHCP Server whereby the attacker broadcasts a large number \nof forged DHCP DISCOVER request messages with spoofed MAC addresses with the intent of exhausting all available IP\n addresses that can be allocated by the DHCP server. Under this attack, legitimate network users can be denied service.";
const F7theory =
    "Port Scanner is an application designed to probe a server or host for open ports.\n Port scanning is a method of determining which ports on a network are open and could be receiving or sending data.";
const F8theory =
    "Operating System (OS) Fingerprinting refers to the detection of the operating system of an end-host by analyzing packets,\n which originate from that system. It is used by security professionals and hackers for mapping remote networks and determining which vulnerabilities might be present to exploit";
//List of all feature present in the hopperjet
const ListFeature = "HopperJet";
// theories for the top four features
const ListF1theory = "Fastest";
const ListF2theory = "Accurate";
const ListF3theory = "Multi-platform";
const ListF4theory = "all in one";
// Hints
const LearnMoreHint = "Learn More";
const IPHint = "Enter the IP address";
const VerifyHint = "Verify";
const StartHint = "Start";
const InterfaceHint = "Enter the Interface"; //refer sakthi
const PortHint = "Port";
const TimeoutHint = "Timeout";
const ThresholdHint = "Threshold";
//Portsanner Dropdown
const port1 = "TCP Connect Scan";
const post2 = "TCP Stealth Scan";
const port3 = "TCP ACK Scan";
const port4 = "TCP Window Scan";
const port5 = "XMAS Scan";
const port6 = "FIN Scan";
const port7 = "NULL Scan";
const port8 = "UDP Scan";
const port9 = "All";
const portList = [
  port1,
  post2,
  port3,
  port4,
  port5,
  port6,
  port7,
  port8,
  port9
];
//Host DiscoveryList
const Host1 = "Nmap";
const Host2 = "Scapy";
const HostList = [Host1, Host2];

//Promiscuous mode Discovery
const prom1 = "IP Address Scan";
const prom2 = "Nmap Subnet Scan";
const prom3 = "Scapy Subnet Scan";
const promList = [prom1, prom2, prom3];

//Imagelist for Carousel
final List<String> CarouselImages = [
  "image/fast.jpg",
  "image/userfriendly.png",
  "image/fluid.jpg",
  "image/multiplatform.png",
  "image/highaccuracy.jpeg",
];
final List<String> CarouselFeatures = [
  "Fast",
  "User Friendly UI",
  "Fluid Design",
  "Multi Platform",
  "High Accuracy"
];

//output checking
const output = """ ashodhaskndashd
sadkasdl
asdknlaskndakds
sakdnaiosda

as
dSDASDASDASDa
SD""";
