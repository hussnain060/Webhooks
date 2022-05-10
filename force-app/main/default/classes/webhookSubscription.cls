@RestResource(urlMapping='/api/webhook/*')
global with sharing class webhookSubscription {

    @HttpPost
    global static void handleWebhook(){
        try{
            RestRequest request = RestContext.request;
            RestResponse response = RestContext.response;
            // JSONParser parser = JSON.createParser(request.requestBody.toString());
            // pusher ps;
            // // head_commit hc;
            // String repo;
            // while (parser.nextToken() != null) {
            //     if(parser.getText() == 'pusher'){
            //         System.debug('Inside pusher');
            //         parser.nextToken();
            //         ps = (pusher)parser.readValueAs(pusher.class);
            //         System.debug(ps);
            //     }
            // }
            ////
            // Git_Push_Details__c detail = new Git_Push_Details__c();
            // detail.Committer_Name__c = ps != null?ps.name:'';
            // detail.Committer_Email__c = ps != null?ps.email:'';
            // insert detail;
            // response.statusCode = 200;
            // response.responseBody = Blob.valueOf(JSON.serialize(new SFDCResponse('Success', 'Processed Successfully')));
        }
        catch(Exception e){
            System.debug('Exception happened: '+e.getMessage());
        }
    }

    public class pusher{
        public String name;
        public String email;
        public pusher(String name, String email){
            name = name;
            email = email;
        }
    }

    public class SFDCResponse{
        String response;
        String message;
        public SFDCResponse(String resp, String msg){
            response = resp;
            message = msg;
        }
    }
}