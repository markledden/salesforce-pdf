public with sharing class GeneratePDF {

    public GeneratePDF(String json, Id recordId) {

        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://app.useanvil.com/api/v1/generate-pdf');
        req.setMethod('POST');
        
        String key = ''; // ANVIL_API_KEY
        String resBody = json;

        Blob headerValue = Blob.valueOf(key);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        req.setHeader('Content-Type', 'application/json');
        req.setBody(resBody);
        
        Http http = new Http();
        HTTPResponse res = http.send(req);
        
        // Upload the file to the defined record ID
        ContentVersion cv = new ContentVersion(
            Title = 'PDF-10',
            PathOnClient = 'PDF-10.pdf',
            VersionData = res.getBodyAsBlob(),
            FirstPublishLocationId = recordId
        );
        insert cv;
    }
}
