package com.jmu.domain;

import java.io.Serializable;
import java.util.Date;

public class MessageBoard implements Serializable{
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column message_board.MESSAGE_BOARD_ID
     *
     * @mbggenerated Wed May 17 17:42:15 CST 2017
     */
    private String messageBoardId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column message_board.COMPANY_ID
     *
     * @mbggenerated Wed May 17 17:42:15 CST 2017
     */
    private String companyId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column message_board.USER_NAME
     *
     * @mbggenerated Wed May 17 17:42:15 CST 2017
     */
    private String userName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column message_board.MAILBOX
     *
     * @mbggenerated Wed May 17 17:42:15 CST 2017
     */
    private String mailbox;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column message_board.CONTENT
     *
     * @mbggenerated Wed May 17 17:42:15 CST 2017
     */
    private String content;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column message_board.CREATE_TIME
     *
     * @mbggenerated Wed May 17 17:42:15 CST 2017
     */
    private Date createTime;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column message_board.MESSAGE_BOARD_ID
     *
     * @return the value of message_board.MESSAGE_BOARD_ID
     *
     * @mbggenerated Wed May 17 17:42:15 CST 2017
     */
    public String getMessageBoardId() {
        return messageBoardId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column message_board.MESSAGE_BOARD_ID
     *
     * @param messageBoardId the value for message_board.MESSAGE_BOARD_ID
     *
     * @mbggenerated Wed May 17 17:42:15 CST 2017
     */
    public void setMessageBoardId(String messageBoardId) {
        this.messageBoardId = messageBoardId == null ? null : messageBoardId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column message_board.COMPANY_ID
     *
     * @return the value of message_board.COMPANY_ID
     *
     * @mbggenerated Wed May 17 17:42:15 CST 2017
     */
    public String getCompanyId() {
        return companyId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column message_board.COMPANY_ID
     *
     * @param companyId the value for message_board.COMPANY_ID
     *
     * @mbggenerated Wed May 17 17:42:15 CST 2017
     */
    public void setCompanyId(String companyId) {
        this.companyId = companyId == null ? null : companyId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column message_board.USER_NAME
     *
     * @return the value of message_board.USER_NAME
     *
     * @mbggenerated Wed May 17 17:42:15 CST 2017
     */
    public String getUserName() {
        return userName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column message_board.USER_NAME
     *
     * @param userName the value for message_board.USER_NAME
     *
     * @mbggenerated Wed May 17 17:42:15 CST 2017
     */
    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column message_board.MAILBOX
     *
     * @return the value of message_board.MAILBOX
     *
     * @mbggenerated Wed May 17 17:42:15 CST 2017
     */
    public String getMailbox() {
        return mailbox;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column message_board.MAILBOX
     *
     * @param mailbox the value for message_board.MAILBOX
     *
     * @mbggenerated Wed May 17 17:42:15 CST 2017
     */
    public void setMailbox(String mailbox) {
        this.mailbox = mailbox == null ? null : mailbox.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column message_board.CONTENT
     *
     * @return the value of message_board.CONTENT
     *
     * @mbggenerated Wed May 17 17:42:15 CST 2017
     */
    public String getContent() {
        return content;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column message_board.CONTENT
     *
     * @param content the value for message_board.CONTENT
     *
     * @mbggenerated Wed May 17 17:42:15 CST 2017
     */
    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column message_board.CREATE_TIME
     *
     * @return the value of message_board.CREATE_TIME
     *
     * @mbggenerated Wed May 17 17:42:15 CST 2017
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column message_board.CREATE_TIME
     *
     * @param createTime the value for message_board.CREATE_TIME
     *
     * @mbggenerated Wed May 17 17:42:15 CST 2017
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}