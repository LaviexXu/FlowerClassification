function varargout = flower_classification(varargin)
% FLOWER_CLASSIFICATION MATLAB code for flower_classification.fig
%      FLOWER_CLASSIFICATION, by itself, creates a new FLOWER_CLASSIFICATION or raises the existing
%      singleton*.
%
%      H = FLOWER_CLASSIFICATION returns the handle to a new FLOWER_CLASSIFICATION or the handle to
%      the existing singleton*.
%
%      FLOWER_CLASSIFICATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FLOWER_CLASSIFICATION.M with the given input arguments.
%
%      FLOWER_CLASSIFICATION('Property','Value',...) creates a new FLOWER_CLASSIFICATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before flower_classification_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to flower_classification_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help flower_classification

% Last Modified by GUIDE v2.5 09-Jan-2018 14:46:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @flower_classification_OpeningFcn, ...
                   'gui_OutputFcn',  @flower_classification_OutputFcn, ...
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


% --- Executes just before flower_classification is made visible.
function flower_classification_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to flower_classification (see VARARGIN)

% Choose default command line output for flower_classification
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes flower_classification wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = flower_classification_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uigetfile({'*.jpg'},'选择图片');
% 合成路径+文件名
str=[pathname filename];  
im=imread(str); 
axes(handles.axes1);
imshow(im);
set(handles.filepath,'string',str);
set(handles.result,'string','点击按钮进行分类');
disp(str);



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 filepath = get(handles.filepath,'String');
 if(isempty(filepath))
     set(handles.result,'string','请先选择图片');
 else
     class = classify(filepath);
     switch class
         case 1
             result = 'buttercup';
         case 2
             result = 'daisy';
         case 3
             result = 'iris';
         case 4
             result = 'lilyvalley';
         case 5
             result = 'sunflower';
         case 6
             result = 'windflower';
     end
     set(handles.result,'string',result);
 end
 


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
