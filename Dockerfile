FROM microsoft/dotnet:2.2-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 5010
EXPOSE 1433

FROM microsoft/dotnet:2.2-sdk AS build
WORKDIR /src

COPY ["src/Web/Web.csproj", "src/Web/"]
RUN dotnet restore "src/Web/Web.csproj"
COPY . .
WORKDIR "/src/src/Web"
RUN dotnet build "Web.csproj" -c Debug -o /app

FROM build AS publish
RUN dotnet publish "Web.csproj" -c Debug -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENV ASPNETCORE_URLS="http://+:5010"
ENTRYPOINT ["dotnet", "Web.dll"]