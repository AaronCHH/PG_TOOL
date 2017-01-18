#include <iostream>
#include <string>
#include <stdio.h>
#include <stdlib.h>
#include <dir.h>
#include <windows.h>
using namespace std;
int main(void)
{
  // char name[15];
  string name="";
  int n;

  puts("folder name:");
  getline(cin, name);
  //  cout << name << endl;

  puts("number of folders:");
  scanf("%d", &n);
  //  printf("%d\n", n);

  for (int i = 1; i <= n; ++i)
  { 
    if (i < 10){
      string str = name + to_string(0) + to_string(i);
      CreateDirectory(str.c_str(), NULL);
    } else {
      string str = name + to_string(i);
      CreateDirectory(str.c_str(), NULL);
    }    
  }  

  // system("pause");
  return 0;
}


