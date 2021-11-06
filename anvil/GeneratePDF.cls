public with sharing class GeneratePDF {

    public GeneratePDF(String json, Id recordId) {

        //public String json;
        //public Id recordId;

        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://app.useanvil.com/api/v1/generate-pdf');
        req.setMethod('POST');
        
        String key = '';
        //String resBody = '{"title":"Anvil Doghouse Project Invoice","logo":{"src":"https://raw.githubusercontent.com/anvilco/public-assets/master/twitter.png","maxWidth":120,"maxHeight":120},"fontSize":18,"textColor":"#171717","includeTimestamp":true,"data":[{"content":"March 4th, 2024","fontSize":16,"textColor":"#616161"},{"label":"To","content":"Phoebe Beckett - phoebe@example.com","fontSize":12,"textColor":"#006ec2"},{"label":"From","content":"Anvil Inc. - hello@useanvil.com","fontSize":12,"textColor":"#006ec2"},{"label":"Building material expenses","table":{"rows":[["Description","Quantity","Price"],["3x Roof Shingles","15","$60.00"],["5x Hardwood Plywood","10","$300.00"],["80x Wood Screws","80","$45.00"],["3x Ombre Swirl deluxe dog bed for medium dog breeds between 26 to 40 pounds. With ultra-soft synthetic fur and overstuffed dog bed with non-slide grip that pairs well with hardwood or tiled floors. Easily maintainble, easy to clean, and perfect for any home environment. Lasts over 5 years with 1 year warranty included.","3","$190.00"]],"columnOptions":[{"align":"left","width":"60%"},{"align":"center","width":"100px"},{"align":"right"}],"verticalAlign":"top","firstRowHeaders":true,"rowGridlines":true,"columnGridlines":true},"fontSize":10},{"label":"Food expenses","table":{"rows":[["Description","Quantity","Price"],["20x Dog Biscuits","20","$50.00"],["10x Air-dried Dog Food. Gently dehydrated to preserve nutrients and flavor while killing germs. No fridge or prep required. Simply pour into bowl.","10","$75.00"]],"columnOptions":[{"align":"left","width":"40%"},{"align":"left"},{"align":"left","width":"200px"}],"verticalAlign":"center","firstRowHeaders":true,"rowGridlines":false,"columnGridlines":true},"fontSize":10},{"label":"Total Amount","table":{"rows":[["**Tax**","$64.80"],["***Total***","$784.80"]],"firstRowHeaders":false},"fontSize":14,"textColor":"#db0000"}]}';
        String resBody = json;

        Blob headerValue = Blob.valueOf(key);
        String authorizationHeader = 'Basic ' +
        EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        req.setHeader('Content-Type', 'application/json');
        req.setBody(resBody);
        
        Http http = new Http();
        HTTPResponse res = http.send(req);
        
        ContentVersion cv = new ContentVersion(
            Title = 'PDF-10',
            PathOnClient = 'PDF-10.pdf',
            VersionData = res.getBodyAsBlob(),
            FirstPublishLocationId = recordId
        );
        insert cv;
        
        
        


    }
}
