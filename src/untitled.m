function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 08-Oct-2016 11:57:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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
end

% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN);

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
handles.current_data = 'Red';
% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end

% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
    
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uigetfile('.jpg','select an img');
global img
img = imread(filename);
[row, col, plane] = size(img);
img = double(img);

if plane ~= 3
    disp('Input should be a color img');
    return;
end
imshow(uint8(img), 'parent', handles.axes1);
end

% function setGlobalvar(val)
% global x
% x = val;
% end

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject,  eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

str = get(hObject,'String');
val = get(hObject, 'Value');
switch (str{val})
    case 'Red'
        Colors(1, handles);
     case 'Orange'
        Colors(2, handles);
    case 'Yellow'
        Colors(3, handles);
     case 'Green'
        Colors(4, handles);
     case 'Blue'
        Colors(5, handles);
      case 'Indigo'
        Colors(6, handles);
       case 'Violet'
        Colors(7, handles);
end
end

function Colors(val, handles)
GL = 255;
switch val
    case 1 % User selects Red Color
        f1 = (GL * 1);
        f2 = (GL * 0.4);
        f3 = (GL * 0.5);
        f4 = (GL * 0);
        f5 = (GL * 0.5);
        f6 = (GL * 0);
        m = 1;
        flg = 0;
        
    case 2 %User selects Orange Color
        f1 = (GL * 1);
        f2 = (GL * 0.6);
        f3 = (GL * 0.68);        
        f4 = (GL * 0.3);
        f5 = (GL * 0.3);
        f6 = (GL * 0);
        m = 1;
        flg = 0;
       
    case 3 %user Selects Yellow
        f1 = (GL * 1);
        f2 = (GL * 0.78);
        f3 = (GL * 1);        
        f4 = (GL * 0.72);
        f5 = (GL * 0.52);
        f6 = (GL * 0);
        m = 1;
        flg = 1;
        
    case 4 % User selects Green
        f1 = (GL * 0.68);
        f2 = (GL * 0);
        f3 = (GL * 1);
        f4 = (GL * 0.4);
        f5 = (GL * 0.68);
        f6 = (GL * 0);
        m = 2; flg = 0;
        
    case 5 %User Selects Blue
        f1 = (GL * 0.5);
        f2 = (GL * 0);
        f3 = (GL * 0.68);
        f4 = (GL * 0);
        f5 = (GL * 1);
        f6 = (GL * 0.4);
        m = 3; flg = 0;
        
    case 6 %user selects Indigo
        f1 = (GL * 0.68);
        f2 = (GL * 0);
        f3 = (GL * 1);        
        f4 = (GL * 0.6);
        f5 = (GL * 1);
        f6 = (GL * 0.6);
        m = 1; flg = 1;
        
    case 7 %User selects Violet
        f1 = (GL * 1);
        f2 = (GL * 0.6);
        f3 = (GL * 0.68);        
        f4 = (GL * 0);
        f5 = (GL * 1);
        f6 = (GL * 0.6);
        m = 3; flg = 1;
        
end
cfilter(f1,f2,f3,f4,f5,f6,m,flg, handles);
end

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
% imshow(img, 'parent', handles.axes2);

function popupmenu1_CreateFcn(hObject, ~, ~)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
%Function to segment img
function C = cfilter(f1,f2,f3,f4,f5,f6,m,flg, handles)
global img;
[row col plane] = size(img);
C = zeros(row,col,plane);
for i = 1:row
    for j = 1:col
        if flg == 0
            if (img(i,j,1) <= f1 && img(i,j,1) >= f2 && ...
                img(i,j,2) <= f3 && img(i,j,2) >= f4 && ...
                img(i,j,3) <= f5 && img(i,j,3) >= f6 ...
                && img(i,j,m) == max([img(i,j,1) img(i,j,2) img(i,j,3)]))
                C(i,j,1:3) = img(i,j,1:3);
            else
                C(i,j,1:3) = (img(i,j,1) * 0.3) + (img(i,j,2) * 0.59) + (img(i,j,3) * 0.11);
            end
        else
            if (img(i,j,1) <= f1 && img(i,j,1) >= f2 && ...
                img(i,j,2) <= f3 && img(i,j,2) >= f4 && ...
                img(i,j,3) <= f5 && img(i,j,3) >= f6)
                C(i,j,1:3) = img(i,j,1:3);
            else
                C(i,j,1:3) = (img(i,j,1) * 0.3) + (img(i,j,2) * 0.59) + (img(i,j,3) * 0.11);
            end
        end
    end
end
imshow(uint8(C), 'parent', handles.axes2);
end

% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: place code in OpeningFcn to populate axes2
end

function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: place code in OpeningFcn to populate axes2
end
