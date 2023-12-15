*** Settings ***
Library    RequestsLibrary

*** Variables ***

${BASE_URL}    http://10.110.0.4:8080
${ENDPOINT}    /v1/analytics/teleconsultation/by-avg-teleconsultations-per-patients
${QUERY_STRING}    ?teleconsultationTypeId=EMERGENCY&centerId=3fa85f64-5717-4562-b3fc-2c963f66afa6&specialtiesId=3fa85f64-5717-4562-b3fc-2c963f66afa6&startDate=2021-01-29&endDate=2024-05-31&customerId=9674e054-9ab2-11ee-b9d1-0242ac120002

*** Test Cases ***
Validate API Endpoint
    [Documentation]    Testa se o endpoint da API retorna um código 200.
    Create Session    my_session    ${BASE_URL}
    ${url}=    Set Variable    ${ENDPOINT}${QUERY_STRING}
    ${response}=    GET On Session    my_session    ${url}
    Should Be Equal As Numbers    ${response.status_code}    200
