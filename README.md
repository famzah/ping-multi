# ping-multi
Interactively ping one or multiple hosts.

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

The host status changes can be logged to a file. This allows you to review the time of each event.

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

Ping multiple hosts specified directly on the command-line; you can also provide just one host:
```bash
sudo ./ping-multi google.com github.com
```

Ping multiple hosts specified in a file; you can also add more single hosts directly as additional command-line arguments:
```bash
sudo ./ping-multi -f sample.list
```

Ping and log up/down events to a file:
```bash
sudo ./ping-multi -l events.log google.com github.com
```

Ping hosts synchronously; [this comment](https://github.com/famzah/ping-multi/pull/2#issuecomment-339098285) explains when this ping method is useful:
```bash
sudo ./ping-multi -S 192.168.0.1 192.168.0.2 192.168.0.15
```

Making ICMP ping requests requires "root" privileges on Linux.

# Docker

You can also use Docker to run ping-multi:
```bash
docker run --rm -it chrislwade/ping-multi
docker run --rm -it chrislwade/ping-multi google.com github.com
docker run --rm -it chrislwade/ping-multi -f sample.list
docker run --rm -it chrislwade/ping-multi -l events.log google.com github.com
docker run --rm -it chrislwade/ping-multi -S 192.168.0.1 192.168.0.2 192.168.0.15
```
