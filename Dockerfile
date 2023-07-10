#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["AutoMarketApi/AutoMarketApi.csproj", "AutoMarketApi/"]
COPY ["Entities/Entities.csproj", "Entities/"]
RUN dotnet restore "AutoMarketApi/AutoMarketApi.csproj"
COPY . .
WORKDIR "/src/AutoMarketApi"
RUN dotnet build "AutoMarketApi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "AutoMarketApi.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENV ASPNETCORE_URLS="http://0.0.0.0:5000"
ENTRYPOINT ["dotnet", "AutoMarketApi.dll"]