package model;

import java.io.InputStream;

public class FileContainer {

    /**
     * �ļ���
     */
    private InputStream fileInputStream;
    /**
     * �ļ���
     */
    private String fileName;

    public InputStream getFileInputStream() {
        return fileInputStream;
    }

    public void setFileInputStream(InputStream fileInputStream) {
        this.fileInputStream = fileInputStream;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
}
