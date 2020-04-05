package com.zb.util;

import com.cloopen.rest.sdk.CCPRestSmsSDK;
import org.springframework.stereotype.Component;

import java.util.HashMap;

@Component
public class SMSUtil {
    public void send(String to, String templated, String[] datas) {
        CCPRestSmsSDK sdk = new CCPRestSmsSDK();
        sdk.init("app.cloopen.com", "8883");
        sdk.setAccount("8a216da870e2267e01712958016524a0", "fd12b6a579e84f8f8a67338da5cc179c");
        sdk.setAppId("8a216da870e2267e0171295801bf24a6");
        HashMap result = sdk.sendTemplateSMS(to, templated, datas);
    }
}
