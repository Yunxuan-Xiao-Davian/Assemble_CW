#include<iostream>
#include"multi_asm.h""
using namespace std;
int main() {
	cout << "this is procedure which can multiply two integer numbers." << endl;
	int index1, index2, result, mode=1,n,index[100];
	cout << "please enter how many numbers you want to multiply,choose mode 1 if the number is more than 2,no more than 100" << endl;
	cin >> n;
	cout << "please enter the number you want to multiply" << endl;
	if (n == 1) {
		cout << "number of the array is not correct, choose again";
		return -1;
	}
	if (n == 2) {
		cin >> index1;
		cin >> index2;
	}
	else {
		for (int i = 0; i < n; i++) {
			cin >> index[i];
		}
	}
	cout << "please select the mode you want to use" << endl<<"Mode1 is an outline, Mode2 is an inline,modle3 is the algorithm i created, modle4 is C++ to achieve that"<<endl;
	cin >> mode;
	result = 0;
	if (mode == 1) {
		_asm
		{
			push index
			mov esi,0
			mov ecx,n
			mov result,1
			L:
				mov eax, result
				mov ebx, [index+esi]
				mov edi, 0
			L1:
				mov edx, eax
				and edx, 1
				cmp edx, 0
				jz L2
				add edi, ebx
			L2 :
				shr eax, 1
				shl ebx, 1
				cmp eax, 0
				jg L1
				mov result, edi
			add esi,4
			loop L
			pop index
		}
		cout << result<<endl;
	}
	if (mode == 2) {
		int signal=0;
		if (index1 < 0) {
			signal++;
		}
		if (index2 < 0) {
			signal++;
		}
		index1 = abs(index1);
		index2 = abs(index2);
		result=multiple(index1, index2);
		if (signal == 1) {
			result = -result;
		}
		cout << result;
	}
	if (mode == 3) {
		int signal = 0;
		if (index1 < 0) {
			signal++;
		}
		if (index2 < 0) {
			signal++;
		}
		index1 = abs(index1);
		index2 = abs(index2);
		int count = 0;
		int a = index1;
		int b = index2;
		while (a != 0) {
			count++;
			a >>= 1;
		}
		count --;
		a = 1<<count;
		index1 -= a;
		index2 <<= count;
		result = index2 + b * index1;
		if (signal == 1) {
			result = -result;
		}
		cout << result << endl;
	}
	if (mode == 4) {
		while (index1 != 0) {
			if (index1 & 1 != 0) {
				result += index2;
			}
			index1 >>= 1;
			index2 <<= 1;		
		}
		cout << result << endl;
	}

}