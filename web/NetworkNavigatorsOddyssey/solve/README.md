# Network Navigators Oddyssey Writeup
## The Weaknesses
### Command Injection:
- User input is being passed directly to subprocess.Popen() function with shell=True, which allows it to be interpreted by the system shell.
### Whitelist Bypass:
- If you look closely at the code, you'll spot that the code doesn't completely 