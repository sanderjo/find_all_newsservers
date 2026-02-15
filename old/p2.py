import socket
import ssl

def get_nntp_banner(ip, port=563):
    # 1. Create an unverified SSL context (ignores cert errors)
    context = ssl._create_unverified_context()

    try:
        with socket.create_connection((ip, port), timeout=5) as sock:
            with context.wrap_socket(sock, server_hostname=ip) as ssock:
                # 2. Start the read loop
                buffer = ""
                while True:
                    # Read in small chunks
                    data = ssock.recv(4096).decode('utf-8', errors='ignore')
                    
                    if not data:
                        break  # Connection closed by server
                    
                    buffer += data
                    
                    # 3. Check if we have our "20" line yet
                    lines = buffer.splitlines()
                    for line in lines:
                        if line.startswith('20'):
                            print(f"[{ip}] Found: {line}")
                            return line # Exit once found
                            
                print(f"[{ip}] Connection closed without '20' code.")
                
    except Exception as e:
        print(f"[{ip}] Error: {e}")

if __name__ == "__main__":
    get_nntp_banner("185.90.196.19")
