#include <stdio.h>
#include <stdlib.h>

#define SPACE 0x20
#define TILDE 0x7e
#define CONSECBYTES 16

int main() {
        FILE* pFile = NULL;

        //open the file in read-only mode
        pFile = fopen("binary.out", "r");

        //if the file was found
        if (pFile != NULL) {
                size_t portionRead; //Goes up by 16 for each iteration
                int currAddress = 0; //the current address of data
                char readArray[CONSECBYTES]; //we store the current read values 
					     //in the array, we print each one and their ascii representation
                while ((portionRead = fread(readArray, 1, sizeof readArray, pFile)) > 0) {
                        printf("%08x ", currAddress); //prints in hex format with 8 total characters and a space
                        currAddress += portionRead;

                        //print hex values
                        for (int i = 0; i < CONSECBYTES; i++) {
				//prints in hex format with total 2 characters
                                printf("%02x", (unsigned char)readArray[i]); 
                                printf("%c", SPACE); //print a space to separate the hex values
                        }

                        printf("%c", '|'); //separate the hex rep and the ASCII rep
                        //print the ASCII rep
                        for (int i = 0; i < portionRead; i++) {
                                //if greater than or equal to hex for space, and less than or equal to hex for ~
                                if (readArray[i] >= SPACE && readArray[i] <= TILDE) {
                                        printf("%c", readArray[i]); //Just print the character in ASCII
                                }
                                else {
                                        printf("%c", '.'); //can't rep it, print a .
                                }
                        }

                        //print a newline after each iteration
                        printf("%c", '\n');
                }

                //close the file
                fclose(pFile);
                pFile = NULL;
        }
        else {
                printf("The file could not be opened");
        }

        return 0;
}