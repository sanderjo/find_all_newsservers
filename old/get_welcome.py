import socket
import ssl


def get_nntp_banner(ip, port=563):
    # 1. Create a context that ignores certificate validation
    context = ssl._create_unverified_context()

    try:
        # 2. Create the raw TCP socket
        with socket.create_connection((ip, port), timeout=5) as sock:
            # 3. Wrap the socket with SSL/TLS
            with context.wrap_socket(sock, server_hostname=ip) as ssock:
                # 4. Read the banner (up to 1024 bytes)
                response = ssock.recv(1024).decode('utf-8', errors='ignore')
                print(len(response), response)
                # 5. Filter for the line starting with "20"
                for line in response.splitlines():
                    if line.startswith('20'):
                        print(line)
                        return
    except Exception as e:
        print(f"Error connecting to {ip}: {e}")

if __name__ == "__main__":
    get_nntp_banner("185.90.196.19")
