package com.sist.news;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;

public class Item {
	private String title;
	private String link;
	private String description;
	private String pubDate;
	private String author;
	private String category;
	private String media;
	private String url;
	
	public String getTitle() {
		return title;
	}
	@XmlElement
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLink() {
		return link;
	}
	@XmlElement
	public void setLink(String link) {
		this.link = link;
	}
	public String getDescription() {
		return description;
	}
	@XmlElement
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPubDate() {
		return pubDate;
	}
	@XmlElement
	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}
	public String getAuthor() {
		return author;
	}
	@XmlElement
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getCategory() {
		return category;
	}
	@XmlElement
	public void setCategory(String category) {
		this.category = category;
	}
	public String getMedia() {
		return media;
	}
	@XmlElement
	public void setMedia(String media) {
		this.media = media;
	}
	public String getUrl() {
		return url;
	}
	@XmlAttribute
	public void setUrl(String url) {
		this.url = url;
	}
}
