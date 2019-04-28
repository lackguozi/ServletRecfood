package com.luck;

/**
 * Created by luckguozi on 2019/4/9.
 */
public class Food {
    private  String fid;
    private String name;
    private  String url;

    public Food(){}

    public String getFid() {
        return fid;
    }

    public String getName() {
        return name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public void setFid(String fid) {
        this.fid = fid;
    }

    public void setName(String name) {
        this.name = name;
    }
}
