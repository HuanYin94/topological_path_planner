function [  ] = loadXml( xmlName )
%LOADXML Summary of this function goes here
%   Detailed explanation goes here

    node = xmlread(xmlName);
    
    name_array = node.getElementsByTagName('name');

end

