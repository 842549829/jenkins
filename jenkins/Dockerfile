FROM microsoft/aspnetcore:latest
WORKDIR /app
COPY ./ .


RUN cd ./jenkins \
    && dotnet restore \
    && dotnet build

WORKDIR /app/jenkins

CMD ["dotnet", "jenkins.dll", "urls", "http://0.0.0.0:5012"]
