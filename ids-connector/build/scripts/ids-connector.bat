@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%"=="" @echo off
@rem ##########################################################################
@rem
@rem  ids-connector startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%"=="" set DIRNAME=.
@rem This is normally unused
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and IDS_CONNECTOR_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if %ERRORLEVEL% equ 0 goto execute

echo. 1>&2
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH. 1>&2
echo. 1>&2
echo Please set the JAVA_HOME variable in your environment to match the 1>&2
echo location of your Java installation. 1>&2

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo. 1>&2
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME% 1>&2
echo. 1>&2
echo Please set the JAVA_HOME variable in your environment to match the 1>&2
echo location of your Java installation. 1>&2

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\ids-connector-7.3.0-plain.jar;%APP_HOME%\lib\ids-webconsole-7.3.0.jar;%APP_HOME%\lib\ids-settings-7.3.0.jar;%APP_HOME%\lib\ids-container-manager-7.3.0.jar;%APP_HOME%\lib\ids-route-manager-7.3.0.jar;%APP_HOME%\lib\ids-infomodel-manager-7.3.0.jar;%APP_HOME%\lib\ids-dataflow-control-7.3.0.jar;%APP_HOME%\lib\camel-processors-7.3.0.jar;%APP_HOME%\lib\ids-api-7.3.0.jar;%APP_HOME%\lib\ConnectorMaven-1.0-SNAPSHOT.jar;%APP_HOME%\lib\camel-idscp2-0.19.3.jar;%APP_HOME%\lib\idscp2-daps-aisec-0.19.3.jar;%APP_HOME%\lib\ktor-client-java-jvm-2.3.11.jar;%APP_HOME%\lib\ktor-client-content-negotiation-jvm-2.3.11.jar;%APP_HOME%\lib\ktor-client-auth-jvm-2.3.11.jar;%APP_HOME%\lib\ktor-client-core-jvm-2.3.11.jar;%APP_HOME%\lib\ktor-serialization-jackson-jvm-2.3.11.jar;%APP_HOME%\lib\ktor-events-jvm-2.3.11.jar;%APP_HOME%\lib\ktor-websocket-serialization-jvm-2.3.11.jar;%APP_HOME%\lib\ktor-serialization-jvm-2.3.11.jar;%APP_HOME%\lib\ktor-websockets-jvm-2.3.11.jar;%APP_HOME%\lib\ktor-http-jvm-2.3.11.jar;%APP_HOME%\lib\ktor-utils-jvm-2.3.11.jar;%APP_HOME%\lib\ktor-io-jvm-2.3.11.jar;%APP_HOME%\lib\kotlinx-coroutines-jdk8-1.8.1.jar;%APP_HOME%\lib\kotlinx-coroutines-slf4j-1.8.1.jar;%APP_HOME%\lib\idscp2-app-layer-0.19.3.jar;%APP_HOME%\lib\idscp2-core-0.19.3.jar;%APP_HOME%\lib\kotlinx-coroutines-core-jvm-1.8.1.jar;%APP_HOME%\lib\kotlinx-coroutines-reactor-1.8.1.jar;%APP_HOME%\lib\kotlinx-coroutines-reactive-1.8.1.jar;%APP_HOME%\lib\idscp2-api-0.19.3.jar;%APP_HOME%\lib\kotlin-stdlib-jdk8-2.0.0.jar;%APP_HOME%\lib\kotlin-stdlib-jdk7-2.0.0.jar;%APP_HOME%\lib\infomodel-4.1.3.jar;%APP_HOME%\lib\java-jwt-4.4.0.jar;%APP_HOME%\lib\spring-boot-starter-web-3.3.0.jar;%APP_HOME%\lib\spring-boot-starter-json-3.3.0.jar;%APP_HOME%\lib\camel-jsonpath-starter-3.18.8.jar;%APP_HOME%\lib\camel-jsonpath-3.18.8.jar;%APP_HOME%\lib\jena-arq-4.1.0.jar;%APP_HOME%\lib\jackson-datatype-jdk8-2.17.1.jar;%APP_HOME%\lib\jackson-datatype-jsr310-2.17.1.jar;%APP_HOME%\lib\jackson-module-parameter-names-2.17.1.jar;%APP_HOME%\lib\jjwt-jackson-0.12.5.jar;%APP_HOME%\lib\jackson-databind-2.17.1.jar;%APP_HOME%\lib\jackson-annotations-2.17.1.jar;%APP_HOME%\lib\jackson-core-2.17.1.jar;%APP_HOME%\lib\jackson-module-kotlin-2.17.1.jar;%APP_HOME%\lib\kotlin-reflect-2.0.0.jar;%APP_HOME%\lib\kotlin-stdlib-2.0.0.jar;%APP_HOME%\lib\camel-spring-boot-starter-3.18.8.jar;%APP_HOME%\lib\camel-rest-starter-3.18.8.jar;%APP_HOME%\lib\camel-jetty-starter-3.18.8.jar;%APP_HOME%\lib\camel-http-starter-3.18.8.jar;%APP_HOME%\lib\camel-bean-starter-3.18.8.jar;%APP_HOME%\lib\camel-browse-starter-3.18.8.jar;%APP_HOME%\lib\camel-controlbus-starter-3.18.8.jar;%APP_HOME%\lib\camel-dataformat-starter-3.18.8.jar;%APP_HOME%\lib\camel-dataset-starter-3.18.8.jar;%APP_HOME%\lib\camel-direct-starter-3.18.8.jar;%APP_HOME%\lib\camel-directvm-starter-3.18.8.jar;%APP_HOME%\lib\camel-file-starter-3.18.8.jar;%APP_HOME%\lib\camel-language-starter-3.18.8.jar;%APP_HOME%\lib\camel-log-starter-3.18.8.jar;%APP_HOME%\lib\camel-mock-starter-3.18.8.jar;%APP_HOME%\lib\camel-ref-starter-3.18.8.jar;%APP_HOME%\lib\camel-saga-starter-3.18.8.jar;%APP_HOME%\lib\camel-scheduler-starter-3.18.8.jar;%APP_HOME%\lib\camel-seda-starter-3.18.8.jar;%APP_HOME%\lib\camel-stub-starter-3.18.8.jar;%APP_HOME%\lib\camel-timer-starter-3.18.8.jar;%APP_HOME%\lib\camel-validator-starter-3.18.8.jar;%APP_HOME%\lib\camel-vm-starter-3.18.8.jar;%APP_HOME%\lib\camel-xpath-starter-3.18.8.jar;%APP_HOME%\lib\camel-xslt-starter-3.18.8.jar;%APP_HOME%\lib\camel-xml-jaxp-starter-3.18.8.jar;%APP_HOME%\lib\camel-core-starter-3.18.8.jar;%APP_HOME%\lib\spring-boot-starter-3.3.0.jar;%APP_HOME%\lib\guava-33.2.1-jre.jar;%APP_HOME%\lib\protobuf-java-3.25.3.jar;%APP_HOME%\lib\camel-core-3.18.8.jar;%APP_HOME%\lib\spring-security-crypto-6.3.0.jar;%APP_HOME%\lib\jose4j-0.9.6.jar;%APP_HOME%\lib\mapdb-3.1.0.jar;%APP_HOME%\lib\javax.json-1.1.4.jar;%APP_HOME%\lib\docker-java-api-0.0.13.jar;%APP_HOME%\lib\jnr-unixsocket-0.38.22.jar;%APP_HOME%\lib\camel-management-3.18.8.jar;%APP_HOME%\lib\jaxb-api-2.3.1.jar;%APP_HOME%\lib\jena-core-4.2.0.jar;%APP_HOME%\lib\commons-cli-1.8.0.jar;%APP_HOME%\lib\validation-api-2.0.1.Final.jar;%APP_HOME%\lib\2p-core-4.1.1.jar;%APP_HOME%\lib\2p-parser-4.1.1.jar;%APP_HOME%\lib\commons-text-1.12.0.jar;%APP_HOME%\lib\protonpack-1.16.jar;%APP_HOME%\lib\httpmime-4.5.14.jar;%APP_HOME%\lib\commons-fileupload-1.5.jar;%APP_HOME%\lib\annotations-23.0.0.jar;%APP_HOME%\lib\spring-boot-autoconfigure-3.3.0.jar;%APP_HOME%\lib\spring-boot-3.3.0.jar;%APP_HOME%\lib\spring-boot-starter-logging-3.3.0.jar;%APP_HOME%\lib\spring-boot-starter-tomcat-3.3.0.jar;%APP_HOME%\lib\jakarta.annotation-api-2.1.1.jar;%APP_HOME%\lib\spring-webmvc-6.1.8.jar;%APP_HOME%\lib\spring-web-6.1.8.jar;%APP_HOME%\lib\camel-spring-boot-3.18.8.jar;%APP_HOME%\lib\camel-spring-main-3.18.8.jar;%APP_HOME%\lib\camel-spring-xml-3.18.8.jar;%APP_HOME%\lib\camel-spring-3.18.8.jar;%APP_HOME%\lib\spring-context-6.1.8.jar;%APP_HOME%\lib\spring-aop-6.1.8.jar;%APP_HOME%\lib\spring-tx-6.1.8.jar;%APP_HOME%\lib\spring-beans-6.1.8.jar;%APP_HOME%\lib\spring-expression-6.1.8.jar;%APP_HOME%\lib\spring-core-6.1.8.jar;%APP_HOME%\lib\snakeyaml-2.2.jar;%APP_HOME%\lib\camel-rest-3.18.8.jar;%APP_HOME%\lib\camel-jetty-3.18.8.jar;%APP_HOME%\lib\camel-http-3.18.8.jar;%APP_HOME%\lib\camel-main-3.18.8.jar;%APP_HOME%\lib\camel-core-languages-3.18.8.jar;%APP_HOME%\lib\camel-file-3.18.8.jar;%APP_HOME%\lib\camel-cluster-3.18.8.jar;%APP_HOME%\lib\camel-health-3.18.8.jar;%APP_HOME%\lib\logback-classic-1.5.6.jar;%APP_HOME%\lib\log4j-to-slf4j-2.23.1.jar;%APP_HOME%\lib\jul-to-slf4j-2.0.13.jar;%APP_HOME%\lib\camel-xml-jaxb-dsl-3.18.8.jar;%APP_HOME%\lib\camel-xml-jaxb-3.18.8.jar;%APP_HOME%\lib\camel-core-xml-3.18.8.jar;%APP_HOME%\lib\camel-core-engine-3.18.8.jar;%APP_HOME%\lib\camel-bean-3.18.8.jar;%APP_HOME%\lib\camel-browse-3.18.8.jar;%APP_HOME%\lib\camel-controlbus-3.18.8.jar;%APP_HOME%\lib\camel-dataformat-3.18.8.jar;%APP_HOME%\lib\camel-direct-3.18.8.jar;%APP_HOME%\lib\camel-directvm-3.18.8.jar;%APP_HOME%\lib\camel-language-3.18.8.jar;%APP_HOME%\lib\camel-log-3.18.8.jar;%APP_HOME%\lib\camel-dataset-3.18.8.jar;%APP_HOME%\lib\camel-mock-3.18.8.jar;%APP_HOME%\lib\camel-ref-3.18.8.jar;%APP_HOME%\lib\camel-saga-3.18.8.jar;%APP_HOME%\lib\camel-scheduler-3.18.8.jar;%APP_HOME%\lib\camel-stub-3.18.8.jar;%APP_HOME%\lib\camel-vm-3.18.8.jar;%APP_HOME%\lib\camel-seda-3.18.8.jar;%APP_HOME%\lib\camel-timer-3.18.8.jar;%APP_HOME%\lib\camel-validator-3.18.8.jar;%APP_HOME%\lib\camel-xpath-3.18.8.jar;%APP_HOME%\lib\camel-xslt-3.18.8.jar;%APP_HOME%\lib\camel-xml-jaxp-3.18.8.jar;%APP_HOME%\lib\camel-jetty-common-3.18.8.jar;%APP_HOME%\lib\camel-http-common-3.18.8.jar;%APP_HOME%\lib\camel-core-reifier-3.18.8.jar;%APP_HOME%\lib\camel-cloud-3.18.8.jar;%APP_HOME%\lib\camel-dsl-support-3.18.8.jar;%APP_HOME%\lib\camel-core-model-3.18.8.jar;%APP_HOME%\lib\camel-http-base-3.18.8.jar;%APP_HOME%\lib\camel-attachments-3.18.8.jar;%APP_HOME%\lib\camel-base-engine-3.18.8.jar;%APP_HOME%\lib\camel-base-3.18.8.jar;%APP_HOME%\lib\camel-core-processor-3.18.8.jar;%APP_HOME%\lib\camel-support-3.18.8.jar;%APP_HOME%\lib\json-path-2.9.0.jar;%APP_HOME%\lib\libthrift-0.14.1.jar;%APP_HOME%\lib\jsonld-java-0.13.3.jar;%APP_HOME%\lib\jcl-over-slf4j-2.0.13.jar;%APP_HOME%\lib\jena-base-4.2.0.jar;%APP_HOME%\lib\camel-api-3.18.8.jar;%APP_HOME%\lib\camel-management-api-3.18.8.jar;%APP_HOME%\lib\camel-util-3.18.8.jar;%APP_HOME%\lib\camel-xml-io-util-3.18.8.jar;%APP_HOME%\lib\slf4j-api-2.0.13.jar;%APP_HOME%\lib\failureaccess-1.0.2.jar;%APP_HOME%\lib\listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar;%APP_HOME%\lib\jsr305-3.0.2.jar;%APP_HOME%\lib\checker-qual-3.42.0.jar;%APP_HOME%\lib\error_prone_annotations-2.26.1.jar;%APP_HOME%\lib\reactor-core-3.6.6.jar;%APP_HOME%\lib\reactive-streams-1.0.4.jar;%APP_HOME%\lib\eclipse-collections-forkjoin-10.4.0.jar;%APP_HOME%\lib\eclipse-collections-10.4.0.jar;%APP_HOME%\lib\eclipse-collections-api-10.4.0.jar;%APP_HOME%\lib\lz4-1.3.0.jar;%APP_HOME%\lib\elsa-3.0.0-M5.jar;%APP_HOME%\lib\httpclient-cache-4.5.14.jar;%APP_HOME%\lib\httpclient-4.5.14.jar;%APP_HOME%\lib\jnr-enxio-0.32.17.jar;%APP_HOME%\lib\jnr-posix-3.1.19.jar;%APP_HOME%\lib\jnr-ffi-2.2.16.jar;%APP_HOME%\lib\jnr-constants-0.10.4.jar;%APP_HOME%\lib\bcprov-jdk18on-1.77.jar;%APP_HOME%\lib\javax.activation-api-1.2.0.jar;%APP_HOME%\lib\antlr4-runtime-4.7.2.jar;%APP_HOME%\lib\commons-lang3-3.14.0.jar;%APP_HOME%\lib\commons-io-2.11.0.jar;%APP_HOME%\lib\spring-jcl-6.1.8.jar;%APP_HOME%\lib\tomcat-embed-websocket-10.1.24.jar;%APP_HOME%\lib\tomcat-embed-core-10.1.24.jar;%APP_HOME%\lib\tomcat-embed-el-10.1.24.jar;%APP_HOME%\lib\micrometer-observation-1.13.0.jar;%APP_HOME%\lib\camel-tooling-model-3.18.8.jar;%APP_HOME%\lib\camel-util-json-3.18.8.jar;%APP_HOME%\lib\jetty-servlet-9.4.53.v20231009.jar;%APP_HOME%\lib\jetty-security-9.4.53.v20231009.jar;%APP_HOME%\lib\jetty-server-9.4.53.v20231009.jar;%APP_HOME%\lib\jetty-servlets-9.4.53.v20231009.jar;%APP_HOME%\lib\jetty-client-9.4.53.v20231009.jar;%APP_HOME%\lib\jetty-jmx-9.4.53.v20231009.jar;%APP_HOME%\lib\jetty-http-9.4.53.v20231009.jar;%APP_HOME%\lib\jetty-io-9.4.53.v20231009.jar;%APP_HOME%\lib\jetty-util-ajax-9.4.53.v20231009.jar;%APP_HOME%\lib\jetty-util-9.4.53.v20231009.jar;%APP_HOME%\lib\javax.servlet-api-3.1.0.jar;%APP_HOME%\lib\jjwt-impl-0.12.5.jar;%APP_HOME%\lib\jjwt-api-0.12.5.jar;%APP_HOME%\lib\jena-iri-4.2.0.jar;%APP_HOME%\lib\jaxb-impl-2.3.7.jar;%APP_HOME%\lib\jakarta.xml.bind-api-4.0.2.jar;%APP_HOME%\lib\jaxb-core-2.3.0.1.jar;%APP_HOME%\lib\httpcore-4.4.16.jar;%APP_HOME%\lib\commons-codec-1.16.1.jar;%APP_HOME%\lib\jffi-1.3.13.jar;%APP_HOME%\lib\jffi-1.3.13-native.jar;%APP_HOME%\lib\asm-commons-9.2.jar;%APP_HOME%\lib\asm-util-9.2.jar;%APP_HOME%\lib\asm-analysis-9.2.jar;%APP_HOME%\lib\asm-tree-9.2.jar;%APP_HOME%\lib\asm-9.2.jar;%APP_HOME%\lib\jnr-a64asm-1.0.0.jar;%APP_HOME%\lib\jnr-x86asm-1.0.2.jar;%APP_HOME%\lib\logback-core-1.5.6.jar;%APP_HOME%\lib\log4j-api-2.23.1.jar;%APP_HOME%\lib\micrometer-commons-1.13.0.jar;%APP_HOME%\lib\javax.annotation-api-1.3.2.jar;%APP_HOME%\lib\jetty-continuation-9.4.53.v20231009.jar;%APP_HOME%\lib\jena-shaded-guava-4.2.0.jar;%APP_HOME%\lib\commons-csv-1.9.0.jar;%APP_HOME%\lib\commons-compress-1.21.jar;%APP_HOME%\lib\collection-0.7.jar;%APP_HOME%\lib\jakarta.activation-api-2.1.3.jar;%APP_HOME%\lib\jakarta.activation-1.2.2.jar;%APP_HOME%\lib\javax.activation-1.2.0.jar


@rem Execute ids-connector
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %IDS_CONNECTOR_OPTS%  -classpath "%CLASSPATH%"  %*

:end
@rem End local scope for the variables with windows NT shell
if %ERRORLEVEL% equ 0 goto mainEnd

:fail
rem Set variable IDS_CONNECTOR_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
set EXIT_CODE=%ERRORLEVEL%
if %EXIT_CODE% equ 0 set EXIT_CODE=1
if not ""=="%IDS_CONNECTOR_EXIT_CONSOLE%" exit %EXIT_CODE%
exit /b %EXIT_CODE%

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
