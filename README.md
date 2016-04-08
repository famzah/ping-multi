# ping-multi
Interactively ping multiple hosts.

Screenshot 1:
![Ping-multi Screenshot 1](demo/screenshot-1.jpg?raw=true)

Screenshot 2:
![Ping-multi Screenshot 2](demo/screenshot-2.jpg?raw=true)

# Motivation

A Perl implementation which is easy to install and is also cross-platform.

# Description

Ping-multi reads hosts from a file and sends ICMP ECHO_REQUEST to them. This is the same as the standard "ping", only executed in parallel for many hosts.

The results are displayed in an interactive curses text console which features the following:
- "Hostname" or "Resolved IP" view of the hosts
- Statistics about the ping results of each host:
  - Last round-trip-time (RTT)
  - Packet loss %
  - Average RTT
  - Minimum RTT
  - Maximum RTT
  - Standard deviation of the RTT
  - Received and Transmitted packets count
- Ping history:
  - simple view showing received (.) and lost (X) reply packets
  - scaled view which additionally visualizes the RTT value using the numbers between 0 and 9

You can select the statistics forwards and backwards using the lower "s" and upper "S" keys, similar to the "Vim" behavior.

# Installation

The program depends on the following additional Perl modules:
- Curses
- JSON
- Statistics::Descriptive
 
On Debian/Ubuntu you can install them using the following command:

```bash
sudo apt-get install libcurses-perl libjson-perl libstatistics-descriptive-perl
```

# Example

```bash
sudo ./ping-multi sample.list
```

Making ICMP ping requests requires "root" privileges on Linux.

You can also use "ping-multi" only for one host, in order to benefit from the real-time statistics and history screen:

```bash
sudo ./ping-multi -s google.com
```
