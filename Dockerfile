FROM ubuntu:latest
   
MAINTAINER jiban      
# Update and install required dependencies
RUN apt-get update && \ 
    apt-get install -y python3 python3-pip
  
# Set the working directory in the container
WORKDIR /app     
     
# Copy the current directory contents into the container at /app          
#"COPY . ." we can use this also
COPY . .    
      
# Install any needed packages specified in requirements.txt
RUN pip3 install -r requirements.txt
    
# Expose port 8501 for Streamlit
EXPOSE 8501    
    
# Run Streamlit app
CMD ["streamlit", "run", "--server.port", "8501", "App.py"]      
