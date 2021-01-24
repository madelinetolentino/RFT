Installing the prerequisites
1. Check if python is installed on your system
    python --version
    pip --version

 	Better if python 3.8.7 is installed

2. Once python is installed, install robot framework by:
	- pip install robotframework
	- python -m pip install robotframework
	- python -m pip install robotframework-selenium2library

3. Set Chrome, IE and Firefox webdrivers to PATH
4. Load Invalid_Tests.robot on your IDE then run test cases
	default browser: Chrome
	To override browser execute:
	robot --variable browser:<Browser_Name> Invalid_Tests.robot 