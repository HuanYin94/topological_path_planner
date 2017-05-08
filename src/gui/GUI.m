function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 08-May-2017 15:18:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)

    set(handles.text2, 'String', 'START LOADING');

    global point poseRt pose7;
    point = loadData('/home/yh/wholeMap.txt', 300);
    
    in = evalin('base', 'icpodom1');
    poseRt = loadOdom(in, 60);
    
    
    for i = 1 : 1 : length(poseRt)
        pose7{i} = RtTo7(poseRt{i}); 
    end
        
    set(handles.text2, 'String', 'LOAD FINISHED');


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
    
    cla reset;
    
    set(handles.text2, 'String', 'DRAWING POINTS');

    global point poseRt pose7;
%     for i = 1 : 1 : length(point)
%         plot3(handles.axes1, point{i}(1, 1), point{i}(1, 2), point{i}(1, 3), 'r.', 'markersize', 3);
%         hold on;
%     end
    
    for i = 1 : 1 : length(pose7)
        p = poseRt{i};
        plot3(handles.axes1, p(1,4),p(2,4),p(3,4),'k.', 'markersize', 8);
        
        % show turn points
        if pose7{i}(1, 8) == 1
            plot3(handles.axes1, poseRt{i}(1,4), poseRt{i}(2,4), poseRt{i}(3,4),'r*', 'markersize', 8);
        end
        
        % show fork points
        if pose7{i}(1, 9) == 1
            plot3(handles.axes1, poseRt{i}(1,4), poseRt{i}(2,4), poseRt{i}(3,4),'mo', 'markersize', 8);
        end
        
        hold on;
    end
    
    set(handles.text2, 'String', 'DRAWING POINTS FINISHED');
    
function pushbutton1_Callback(hObject, eventdata, handles)

    set(handles.text2, 'String', 'SELECT TURN-POINTS, PRESS ENTER TO FINISH'); 
    
    global pose7;
    
    [X, Y] = ginput();
    
    set(handles.text2, 'String', 'SELECT TURN-POINTS FINISHED'); 
    
    for i = 1 : 1 : length(pose7)
        for j = 1 : 1 : length(X)
            if (abs(X(j) - pose7{i}(1,1))) < 3 && abs(Y(j) - pose7{i}(1,2)) < 3            
                pose7{i}(1,8) = 1;           
            end
        end    
    end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
