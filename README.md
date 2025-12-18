# predictor

ML Project

1. Create a GitHub repo
	- Title, public, README.md, .gitignore: python
	- Clone the repo
		- In case of multiple GitHub accounts
			- # instead of `git clone https://example.com/open-source/library.git`, run:
			- git clone https://contrib123@example.com/open-source/library.git	
		https://github.com/SagarChhabriya/salary-predictor.git

2. create virtual env
	- activate the env, in case you get a command not recognized error
		- Execute this command in the VS Code PowerShell instance: Set-ExecutionPolicy RemoteSigned -Scope Process
	- install the required libraries: pip install Jupyter ipykernel numpy pandas matplotlib seaborn scikit-learn 
 

3. Data Gathering and Model Training (model.ipynb)
	- select the kernel
	- Load Data and import libraries
	- preprocessing + train test split
	- model training
	- Model evaluation
	- Testing on new instances
	- Model serialization

4. app.py (streamlit UI)
	- import libraries
	- page, title, doc title
	- load model
	- define input fields: st.number_input()
	- make prediction: st.success

5. requirements.txt
	- module.__version__
	- don't do pip freeze

6. streamlit community cloud
	- connect / continue with GitHub
	- utilize default CI/CD
	

7. Build and test docker image
	
	- define Dockerfile

	- docker build -t YOUR_IMAGE_NAME:YOUR_TAG PATH_TO_YOUR_DOCKERFILE
		
		- YOUR_IMAGE_NAME: The name you want to give to your image (e.g., my-app).
		- YOUR_TAG: The tag for the image, often latest or a version number (e.g., v1.0 or latest).
		- PATH_TO_YOUR_DOCKERFILE: The directory path containing your Dockerfile (if it's in the current directory, you can use .). 	
	
	- vs code terminal	
		- docker build -t sal-predictor:latest .
	
	- run the image locally
		- docker run -p 8501:8501 IMAGE_NAME
		
		- If your application requires environment variables, you can pass them using the -e flag:
			- docker run -p 8501:8501 -e PORT=8501 your-image-name

		- If you want to run the container in interactive mode (for example, to troubleshoot or run a script), you can add -it:
			- docker run -it your-image-name /bin/bash

	- push the image to docker hub
		- 1. docker tag your-image-name your-dockerhub-username/your-image-name:your-tag
			- docker tag sal-predictor:latest sagarchhabriya/sal-predictor:latest
		- 2. docker push your-dockerhub-username/your-image-name:your-tag
			- docker push sagarchhabriya/my-app:latest



8. Deploy image on google cloud
	- cloud run
	- deploy one revision from existing  container image
		- docker.io/sagarchhabriya/ml-project:latest
	- Region: any region with low CO2
	- Authentication: Public access
	- remaining default
	- create
	- Error: port mismatch
		- Click Edit & Deploy new version
		- Find Container Port and set it to: 8501, because the streamlit app runs on 8501 
		- deploy