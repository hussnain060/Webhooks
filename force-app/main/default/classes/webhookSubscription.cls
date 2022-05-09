@RestResource(urlMapping='/api/webhook/*')
global with sharing class webhookSubscription {
    @HttpPost
    global static void handleWebhook(){
        try{
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        }
        catch(Exception e){
            System.debug('Exception happened: '+e.getMessage());
        }
    }
}