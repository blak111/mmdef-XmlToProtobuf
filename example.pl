use MmdefXmlToPb;


my $xmlstring = '<malwareMetaData xmlns="http://xml/metadataSharing.xsd" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://xml/metadataSharing.xsd file:metadataSharing.xsd" version="1.200000" id="10000">
    <company>N/A</company>
    <author>MMDEF Generation Script</author>
    <comment>Test MMDEF v1.2 file</comment>
    <timestamp>2011-10-04T10:01:21.721000</timestamp>
    <objects>
        <file id="c7ae4ffe33fc841aea2e0113afa05fdf">
            <md5>c7ae4ffe33fc841aea2e0113afa05fdf</md5>
            <sha1>25daac9d19f18b5ac19769dcf7e5abc154768641</sha1>
            <sha256>e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855</sha256>
            <sha512>cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e</sha512>
            <size>1546790</size>
            <filename>ProcessExplorer.zip</filename>
            <MIMEType>application/zip</MIMEType>
        </file>
        <file id="4edc50d3a427566d6390ca76f389be80">
            <md5>4edc50d3a427566d6390ca76f389be80</md5>
            <sha1>9cb1bd5dc93124f526a1033b1b3f37cc0224a77e</sha1>
            <sha256>e942d28c0e835b8384752731f1b430cb3fbd571381666ded7637a2db47fafcc0</sha256>
            <sha512>3ceb1bd07af9e470ff453ef3dd4b97f9228856cb78eb5cddb7b81796b4b830368e3ed2f0c6a9ce93009397e8158c68dba67e398f58df87137d8872cb0bb3b53b</sha512>
            <size>3412856</size>
            <crc32>1119775926</crc32>
            <filename>procexp.exe</filename>
            <filenameWithinInstaller>procexp.exe</filenameWithinInstaller>
            <internalName>Process Explorer</internalName>
            <language>English (United States)</language>
            <fileVersion>12.04</fileVersion>
            <checksum>00014F7F</checksum>
            <architecture>i386</architecture>
            <buildTimeDateStamp>2010-11-01T21:30:57</buildTimeDateStamp>
            <compilerVersion>Version 8.00.50727</compilerVersion>
            <linkerVersion>2.1</linkerVersion>
            <minOSVersionCPE>cpe:/o:Microsoft:windows_2000:::x86</minOSVersionCPE>
            <numberOfSections>1024</numberOfSections>
            <MIMEType>application/octet-stream</MIMEType>
        </file>
        <softwarePackage id="procexp">
            <vendor>Sysinternals</vendor>
            <product>Process Explorer</product>
            <version>14.11</version>
            <language>English</language>
        </softwarePackage>
        <digitalSignature id="processExpSig" type="CodeSigned">
            <certificateIssuer>Microsoft Code Signing PCA, Microsoft Corporation</certificateIssuer>
            <certificateSubject>Microsoft Corporation, MOPR</certificateSubject>
            <certificateValidity>false</certificateValidity>
            <signingTimestamp>2010-06-07T19:14:02</signingTimestamp>
        </digitalSignature>
        <taggant id="processExpTag">
            <vendorID>Microsoft</vendorID>
            <taggantValidity>true</taggantValidity>
            <signingTimestamp>2011-06-07T19:14:02</signingTimestamp>
        </taggant>
    </objects>
    <relationships>
        <relationship type="createdBy" id="rel1">
            <source>
                <ref>file[@id="c7ae4ffe33fc841aea2e0113afa05fdf"]</ref>
            </source>
            <target>
                <ref>file[@id="4edc50d3a427566d6390ca76f389be80"]</ref>
            </target>
            <timestamp>2011-08-19T13:50:21.924000</timestamp>
        </relationship>
        <relationship type="partOfPackage" id="rel2">
            <source>
                <ref>softwarePackage[@id="procexp"]</ref>
            </source>
            <target>
                <ref>file[@id="4edc50d3a427566d6390ca76f389be80"]</ref>
                <ref>file[@id="c7ae4ffe33fc841aea2e0113afa05fdf"]</ref>
            </target>
            <timestamp>2011-08-19T15:50:21.924000</timestamp>
        </relationship>
        <relationship type="hasSignature" id="rel3">
            <source>
                <ref>digitalSignature[@id="processExpSig"]</ref>
            </source>
            <target>
                <ref>file[@id="4edc50d3a427566d6390ca76f389be80"]</ref>
            </target>
            <timestamp>2011-08-19T15:50:22.924000</timestamp>
        </relationship>
        <relationship type="hasTaggant" id="rel4">
            <source>
                <ref>taggant[@id="processExpTag"]</ref>
            </source>
            <target>
                <ref>file[@id="4edc50d3a427566d6390ca76f389be80"]</ref>
            </target>
            <timestamp>2011-08-19T15:50:23.924000</timestamp>
        </relationship>
    </relationships>
</malwareMetaData>
';

my $protobuf = MmdefXmlToPb->new({data=>$xmlstring});