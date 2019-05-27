#基于 `microsoft/dotnet:1.0.0-core` 来构建我们的镜像
FROM microsoft/dotnet:2.2-aspnetcore-runtime AS base


WORKDIR /app


COPY ./publish /app

#使用`dotnet HelloWebApp.dll`来运行应用程序

CMD ["dotnet", "jenkins.dll", "urls", "http://0.0.0.0:5010"]