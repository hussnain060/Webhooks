@RestResource(urlMapping='/api/webhook/*')
global with sharing class webhookSubscription {
    public class pusher{
        public String name;
        public String email;
        public pusher(String name, String email){
            name = name;
            email = email;
        }
    }

    @HttpPost
    global static void handleWebhook(){
        try{
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        
        System.debug('Secret value Matched and source can be trusted');
        JSONParser parser = JSON.createParser(request.requestBody.toString());
        pusher ps;
        // head_commit hc;
        String repo;
        while (parser.nextToken() != null) {
                if(parser.getText() == 'pusher'){
                    System.debug('Inside pusher');
                    parser.nextToken();
                    ps = (pusher)parser.readValueAs(pusher.class);
                    System.debug(ps);
                }
                // if (parser.getText() == 'head_commit') {
                //     System.debug('Inside head_commit');
                //     parser.nextToken();
                //     hs = (pusher)parser.readValueAs(head_commit.class);
                //     System.debug(hs);
                // }
                // if (parser.getText() == 'full_name') {
                //     System.debug('Inside full_name');
                //     parser.nextToken();
                //     repo = parser.getText();
                //     System.debug(repo);
                // }
            }
            ////
            Git_Push_Details__c detail = new Git_Push_Details__c();
            detail.Committer_Name__c = ps != null?ps.name:'';
            detail.Committer_Email__c = ps != null?ps.email:'';
            // detail.Message__c = hs != null?hs.message:'';
            // detail.Timestamp__c = hs != null?hs.timestamp:'';
            // detail.Commited_URL__c = hs != null?hs.url:'';
            // detail.Repository_Name__c = repo;
            // detail.Added_Component__c = hs != null && hc.added != null? String.join(hc.added,','):'';
            // detail.Removed_Components__c = hc != null && hc.removed != null?String.join(hc.removed, ','): '';
            // detail.Modified_Components__c = hc != null && hc.modified != null?String.join(hc.modified, ','): '';
            insert detail;
            response.statusCode = 200;
            System.debug('Run successfully..');
            // response.responseBody = 'success';
            response.responseBody = Blob.valueOf(JSON.serialize(new SFDCResponse('Success', 'Processed Successfully')));
        }
        // else {
        //     response.statusCode = 401;
        //     response.responseBody = Blob.valueOf(JSON.serialize(new SFDCResponse('Faliure', 'Not a Vaild Sender')));
        // }
        // }
        catch(Exception e){
            System.debug('Exception happened: '+e.getMessage());
        }
    }
}