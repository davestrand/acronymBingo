//
//  ASU.swift
//  AcronymBingo
//
//  Created by Dave Levy on 4/13/23.
//


struct ASU: Equatable {
    static func == (lhs: ASU, rhs: ASU) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    static var shared = ASU()
    
    var id: String = "ASU_1"
    var title: String = "ASU Acronyms"
    
    var centerAcronym = Acronym(id: "free1", title: "FREE", kind: .concept, meaning: "Free Cell", isSelected: true)
    
    let acronyms = [
    
        Acronym(id: "AGCDN1", title: "AGCDN", kind: .software, meaning: "Advanced Global CDN", urlString: "https://pantheon.io/product/advanced-global-cdn"),
        Acronym(id: "AHP1", title: "AHP", kind: .jira, meaning: "Jira tickets related to Arizona Home Page"),
        Acronym(id: "ASISD1", title: "ASISD", kind: .jira, meaning: "Jira projet template for Admission Services Information Systems Development"),
        Acronym(id: "ASUPD1", title: "ASUPD", kind: .jira, meaning: "Jira project template for ASU Police Department"),
        Acronym(id: "ASURA1", title: "ASURA", kind: .people, meaning: "ASU Retirement Organization"),
        Acronym(id: "ASURITE1", title: "ASURITE", kind: .software, meaning: "Arizona State University Rational Information Technology Environment is the primary login for many ASU services and access."),
        Acronym(id: "ATDM1", title: "ATDM", kind: .people, meaning: "The Atlassian Tools Design & Management team manages users from an ASU Google group, so display names are copied from there."),
        Acronym(id: "BP1", title: "BP", kind: .jira, meaning: "Project Jira template: Non-UTO only – lifecycle issue type for Business and Finance projects"),
        Acronym(id: "BFIT1", title: "BFIT", kind: .jira, meaning: "Belonging, Relational, Authentic, Visionary, Empowered"),
        Acronym(id: "BRAVE1", title: "BRAVE", kind: .jira, meaning: "Jira projet template for Admission Services Information Systems Development"),
        Acronym(id: "CCH", title: "CCH", kind: .jira, meaning: "Columbia College Hollywood"),
        Acronym(id: "CDN", title: "CDN", kind: .jira, meaning: "Content Delivery Network"),
        Acronym(id: "CDU", title: "CDU", kind: .jira, meaning: "Jira project template for Critical Drupal Updates"),
        Acronym(id: "CFLEL", title: "CFLEL", kind: .jira, meaning: "Compact X-ray Free Electron Laser"),
        Acronym(id: "CGI", title: "CGI", kind: .jira, meaning: "Jira project template for Center for Games and Impact"),
        Acronym(id: "CHS", title: "CHS", kind: .jira, meaning: "College of Health Solutions"),
        Acronym(id: "CISA", title: "CISA", kind: .jira, meaning: "College of Integrative Sciences and Arts"),
        Acronym(id: "CLAS", title: "CLAS", kind: .jira, meaning: "College of Liberal Arts and Sciences"),
        Acronym(id: "CMDB", title: "CMDB", kind: .jira, meaning: "Configuration Management Database track assets"),
        Acronym(id: "CSAT", title: "CSAT", kind: .jira, meaning: "Customer Satisfaction score"),
        Acronym(id: "CTA", title: "CTA", kind: .jira, meaning: "Call To Action"),
        Acronym(id: "D7D9", title: "D7D9", kind: .jira, meaning: "Drupal 7, Drupal 9"),
        Acronym(id: "DIST", title: "DIST", kind: .jira, meaning: "Distribution?"),
        Acronym(id: "DTProject", title: "DT Project", kind: .jira, meaning: "Jira template: Non-UTO only – lifecycle issue type for Decision Theater projects"),
        Acronym(id: "EA", title: "EA", kind: .jira, meaning: "Earned Admission team?"),
        Acronym(id: "EdgeConversations", title: "Edge Conversations", kind: .jira, meaning: "Quarterly conversation with supervisor about goals and issues."),
        Acronym(id: "EDNA", title: "EDNA", kind: .jira, meaning: "Houses information about a user's id, access, and services a user is subscribed to.?"),
        Acronym(id: "EdPlus", title: "EdPlus", kind: .jira, meaning: "EdPlus is an enterprise unit for Arizona State University focused on the design and scalable delivery of digital teaching and learning models to increase student success and reduce barriers to achievement in higher education."),
        Acronym(id: "EOSS", title: "EOSS", kind: .jira, meaning: "Educational Outreach and Student Services?"),
        Acronym(id: "ET1", title: "ET", kind: .jira, meaning: "Enterprise Technology"),
        Acronym(id: "ETS", title: "ETS", kind: .jira, meaning: "Engineering Technology Services"),
        Acronym(id: "EXAccount", title: "EX Account", kind: .jira, meaning: "Admin account that starts with ex_"),
        Acronym(id: "FA", title: "FA", kind: .jira, meaning: "Font Awesome"),
        Acronym(id: "FANet", title: "FANet", kind: .jira, meaning: "Search for Financial Aid Content"),
        Acronym(id: "FASS", title: "FASS", kind: .jira, meaning: "Financial Aid and Scholarship Services"),
        Acronym(id: "FTE", title: "FTE", kind: .jira, meaning: "Full Time Employee?"),
        Acronym(id: "FY23", title: "FY23", kind: .jira, meaning: "Fiscal Year 2023"),
        Acronym(id: "GA4", title: "GA4", kind: .jira, meaning: "Google Analytics 4"),
        Acronym(id: "GH", title: "GH", kind: .jira, meaning: "GitHub"),
        Acronym(id: "GRE", title: "GRE", kind: .jira, meaning: "Graduate Record Examination"),
        Acronym(id: "GTM", title: "GTM", kind: .jira, meaning: "server container"),
        Acronym(id: "Hive", title: "Hive, The", kind: .jira, meaning: "One of the locations where ET staff may work from in Tempe."),
        Acronym(id: "Hub", title: "Hub", kind: .jira, meaning: "Marketing Hub"),
        Acronym(id: "HUBW", title: "HUBW", kind: .jira, meaning: "The Jira code for Marketing HUB Websites work"),
        Acronym(id: "IAM", title: "IAM", kind: .jira, meaning: "Identity Access Management team"),
        Acronym(id: "Infoblox", title: "Infoblox", kind: .jira, meaning: "A DNS Management tool"),
        Acronym(id: "IM", title: "IM", kind: .jira, meaning: "Identity Management team"),
        Acronym(id: "ITIL", title: "ITIL", kind: .jira, meaning: "Information Technology Infrastructure Library IT service management best practices"),
        Acronym(id: "IRB", title: "IRB", kind: .jira, meaning: "Institutional Review Board"),
        Acronym(id: "JSM", title: "JSM", kind: .jira, meaning: "Jira Service Management (license)"),
        Acronym(id: "KE", title: "KE", kind: .jira, meaning: "Knowledge Enterprise"),
        Acronym(id: "KCS", title: "KCS", kind: .jira, meaning: "Knowledge Centered Service"),
        Acronym(id: "MIC", title: "MIC", kind: .jira, meaning: "Jira project template for Mobile/IoT Configuration"),
        Acronym(id: "MLFTC", title: "MLFTC", kind: .jira, meaning: "Jira project template for Mary Lou Fulton Teachers College"),
        Acronym(id: "MMM", title: "MMM", kind: .jira, meaning: "March Mammal Madness"),
        Acronym(id: "NGN", title: "NGN", kind: .jira, meaning: "Jira project template for NextGen Network"),
        Acronym(id: "OWA", title: "OWA", kind: .jira, meaning: "Outlook Web Access"),
        Acronym(id: "PAN", title: "PAN", kind: .jira, meaning: "The Jira board not visible to client"),
        Acronym(id: "PANS", title: "PANS", kind: .jira, meaning: "The Jira board THAT IS visible to client for Pantheon live"),
        Acronym(id: "PM", title: "PM", kind: .jira, meaning: "Project Management (Not Preventative Maintenance?)"),
        Acronym(id: "PMO", title: "PMO", kind: .jira, meaning: "Jira template: UTO only – lifecycle issue type for UTO PM or PMlite managed projects, including SF Roadmap projects"),
        Acronym(id: "RezBaz", title: "RezBaz", kind: .jira, meaning: "Research Bazaar"),
        Acronym(id: "RFI", title: "RFI", kind: .jira, meaning: "Request For Information form"),
        Acronym(id: "ROAR", title: "ROAR", kind: .jira, meaning: "Rapid Orientation for Accelerated Results"),
        Acronym(id: "SCAP", title: "SCAP", kind: .jira, meaning: "Starbucks College Achievement Plan"),
        Acronym(id: "SFNH", title: "SFNH", kind: .jira, meaning: "Jira template: UTO only – lifecycle issue type for SF Enhancement projects"),
        Acronym(id: "SD", title: "SD", kind: .jira, meaning: "Service Delivery"),
        Acronym(id: "SDR", title: "SDR", kind: .jira, meaning: "Sub Domain Request"),
        Acronym(id: "SERP", title: "SERP", kind: .jira, meaning: "Search Engine Results Page"),
        Acronym(id: "SF", title: "SF", kind: .jira, meaning: "Salesforce"),
        Acronym(id: "SN", title: "SN", kind: .jira, meaning: "Service Now"),
        Acronym(id: "SPA", title: "SPA", kind: .jira, meaning: "Service Paid Agreement (contract work)"),
        Acronym(id: "SPM", title: "SPM", kind: .jira, meaning: "Jira project template for UTO Service Partnership MOB"),
        Acronym(id: "SSP", title: "SSP", kind: .jira, meaning: "Jira project template for SolarSPELL"),
        Acronym(id: "SolarSPELL", title: "SolarSPELL", kind: .jira, meaning: "Solar Solar Powered Educational Learning Library"),
        Acronym(id: "TEMPO", title: "TEMPO", kind: .jira, meaning: "A system for logging time"),
        Acronym(id: "Thrive", title: "Thrive", kind: .jira, meaning: "The official magazine of ASU"),
        Acronym(id: "TLN", title: "TLN", kind: .jira, meaning: "Truster Learner Network project"),
        Acronym(id: "UA", title: "UA", kind: .jira, meaning: "Universal Analytics (old analytics by Google)"),
        Acronym(id: "UDS", title: "UDS", kind: .jira, meaning: "Unity Design System is a platform-agnostic design system that delivers a library of accessible components for the ASU community"),
        Acronym(id: "UHC", title: "UHC", kind: .jira, meaning: "Universal Health Care (one medical insurance plan option)"),
        Acronym(id: "UPRD", title: "UPRD", kind: .jira, meaning: "Jira project template for UTO Products"),
        Acronym(id: "USB", title: "USB", kind: .jira, meaning: "University Services Building"),
        Acronym(id: "USVC", title: "USVC", kind: .jira, meaning: "Jira project template for UTO Services"),
        Acronym(id: "UTO", title: "UTO", kind: .jira, meaning: " University Technology Office (The old name for Enterprise Technology)"),
        Acronym(id: "UOEEE", title: "UOEEE", kind: .jira, meaning: "University Office of Evaluation and Educational Effectiveness"),
        Acronym(id: "WEBSPA", title: "WEBSPA", kind: .jira, meaning: "Jira code for WebSpark tickets."),
        Acronym(id: "WPC", title: "WPC", kind: .jira, meaning: "Jira template: Non-UTO only – lifecycle issue type for W.P. Carey projects"),
        Acronym(id: "WPCarey", title: "W.P. Carey", kind: .jira, meaning: "William Polk Carey School of Business"),
        Acronym(id: "WS1WS2", title: "WS1, WS2", kind: .jira, meaning: "WebSpark 1, WebSpark 2")
    
    ]
}

