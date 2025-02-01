#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/utsname.h>

// ANSI escape codes for bold text
#define BOLD "\033[1m"
#define RESET "\033[0m"
#define RED "\033[1;31m"

int main() {
  // Print initial program info
  printf(BOLD "SysInfo package\n" RESET);
  printf(BOLD "This is a demo package\n" RESET);

  printf("\n" RED);
  printf("Version: 0.0.13");
  printf(RESET "\n");
  printf("\n");
  // Print compilation date and time
  printf(BOLD "Compiled on: " RESET "%s at %s\n", __DATE__, __TIME__);

   // Dynamically fetch and print the username
  char *username = getenv("USER");
  if (username) {
    printf(BOLD "Running as user: " RESET "%s\n", username);
  } else {
    printf(BOLD "User information: " RESET "not available\n");
  }

  // Dynamically fetch and print the hostname
  char hostname[256];
  if (gethostname(hostname, sizeof(hostname)) == 0) {
    printf(BOLD "Running on machine: " RESET "%s\n", hostname);
  } else {
    printf(BOLD "Running on machine: " RESET "not available\n");
  }

  // Dynamically fetch and print the OS info
  struct utsname sysinfo;
  if (uname(&sysinfo) == 0) {
    printf(BOLD "Operating system: " RESET "%s %s\n", sysinfo.sysname, sysinfo.release);
  } else {
    printf(BOLD "Operating system: " RESET "not available\n");
  }

  return 0;
}
