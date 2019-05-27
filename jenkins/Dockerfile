FROM microsoft/dotnet:2.2-aspnetcore-runtime AS base
WORKDIR /app
ENV ASPNETCORE_URLS http://0.0.0.0:5000
EXPOSE 5000
COPY ./publish /app
CMD ["dotnet", "jenkins.dll"]