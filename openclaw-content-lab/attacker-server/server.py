#!/usr/bin/env python3
import argparse
import http.server
import socketserver
from pathlib import Path

LOG_PATH = Path(__file__).parent / "requests.log"


class ExfilLoggingHandler(http.server.BaseHTTPRequestHandler):
    def do_GET(self):
        with open(LOG_PATH, "a") as f:
            f.write(self.path + "\n")
        self.send_response(200)
        self.send_header("Content-Type", "text/plain")
        self.end_headers()
        self.wfile.write(b"received")

    def log_message(self, format, *args):
        pass  # requests.log is the record, stderr noise not needed


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--port", type=int, default=8080)
    args = parser.parse_args()
    with socketserver.TCPServer(("0.0.0.0", args.port), ExfilLoggingHandler) as httpd:
        print(f"attacker-server listening on :{args.port}, logging to {LOG_PATH}")
        httpd.serve_forever()


if __name__ == "__main__":
    main()
