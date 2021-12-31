FROM python:3.8-slim-buster

## Step 1:
# Create a working directory
WORKDIR /app

## Step 2:
# Copy source code to working directory
COPY . app.py /app/

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013,DL3042
RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt

EXPOSE 80

## Step 5:
# Run app.py at container launch
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
