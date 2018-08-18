function varargout = mediaplay2(varargin)
% MEDIAPLAY2 MATLAB code for mediaplay2.fig
%      MEDIAPLAY2, by itself, creates a new MEDIAPLAY2 or raises the existing
%      singleton*.
%
%      H = MEDIAPLAY2 returns the handle to a new MEDIAPLAY2 or the handle to
%      the existing singleton*.
%
%      MEDIAPLAY2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MEDIAPLAY2.M with the given input arguments.
%
%      MEDIAPLAY2('Property','Value',...) creates a new MEDIAPLAY2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mediaplay2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mediaplay2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mediaplay2

% Last Modified by GUIDE v2.5 31-Mar-2016 18:09:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mediaplay2_OpeningFcn, ...
                   'gui_OutputFcn',  @mediaplay2_OutputFcn, ...
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


% --- Executes just before mediaplay2 is made visible.
function mediaplay2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mediaplay2 (see VARARGIN)

% Choose default command line output for mediaplay2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes mediaplay2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mediaplay2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function input1_Callback(hObject, eventdata, handles)
global A N X Y Z;
A=wavread(get(handles.input1,'String'));
N=length(A);
X=zeros(N,1);
Y=zeros(N,1);
Z=zeros(N,1);
set(handles.play1,'Enable','on');
set(handles.stop1,'Enable','on');
set(handles.amp1,'Enable','on');
guidata(hObject,handles);


function input1_CreateFcn(hObject, eventdata, handles)
global current1;
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
current1=1;


% --- Executes on button press in play1.
function play1_Callback(hObject, eventdata, handles)
global A;
sound(A,44100);
plot(handles.plot1,A);

% --- Executes on button press in stop1.
function stop1_Callback(hObject, eventdata, handles)
clear sound;

% --- Executes on button press in amp1.
function amp1_Callback(hObject, eventdata, handles)
clear sound;
global A current1;
current1=current1*2;
A=A*current1;
set(handles.amp1,'String',num2str(current1));
guidata(hObject,handles);

% --- Executes on button press in reset1.
function reset1_Callback(hObject, eventdata, handles)
clear sound;
global A current1;
current1=1;
set(handles.amp1,'String','Amplify');
A=wavread(get(handles.input1,'String'));
plot(handles.plot1,0);




function input2_Callback(hObject, eventdata, handles)
global B N X Y Z;
B=wavread(get(handles.input2,'String'));
if N>length(B)
    N=length(B);
end
X=zeros(N,1);
Y=zeros(N,1);
Z=zeros(N,1);
set(handles.play2,'Enable','on');
set(handles.stop2,'Enable','on');
set(handles.amp2,'Enable','on');
guidata(hObject,handles);


function input2_CreateFcn(hObject, eventdata, handles)
global current2;
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
current2=1;

% --- Executes on button press in play2.
function play2_Callback(hObject, eventdata, handles)
global B;
sound(B,44100);
plot(handles.plot2,B);

% --- Executes on button press in stop2.
function stop2_Callback(hObject, eventdata, handles)
clear sound;

% --- Executes on button press in amp2.
function amp2_Callback(hObject, eventdata, handles)
clear sound;
global B current2;
current2=current2*2;
B=B*current2;
set(handles.amp2,'String',num2str(current2));
guidata(hObject,handles);

% --- Executes on button press in reset2.
function reset2_Callback(hObject, eventdata, handles)
clear sound;
global B current2;
current2=1;
set(handles.amp2,'String','Amplify');
B=wavread(get(handles.input2,'String'));
plot(handles.plot2,0);



function input3_Callback(hObject, eventdata, handles)
global C N X Y Z;
C=wavread(get(handles.input3,'String'));
if N>length(C)
    N=length(C);
end
X=zeros(N,1);
Y=zeros(N,1);
Z=zeros(N,1);
set(handles.play3,'Enable','on');
set(handles.stop3,'Enable','on');
set(handles.amp3,'Enable','on');
guidata(hObject,handles);


function input3_CreateFcn(hObject, eventdata, handles)
global current3 current4;
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
current3=1;
current4=1;


% --- Executes on button press in play3.
function play3_Callback(hObject, eventdata, handles)
global C;
sound(C,44100);
plot(handles.plot3,C);

% --- Executes on button press in stop3.
function stop3_Callback(hObject, eventdata, handles)
clear sound;

% --- Executes on button press in amp3.
function amp3_Callback(hObject, eventdata, handles)
clear sound;
global C current3;
current3=current3*2;
C=C*current3;
set(handles.amp3,'String',num2str(current3));
guidata(hObject,handles);

% --- Executes on button press in reset3.
function reset3_Callback(hObject, eventdata, handles)
clear sound;
global C current3;
current3=1;
set(handles.amp3,'String','Amplify');
C=wavread(get(handles.input3,'String'));
plot(handles.plot3,0);



% --- Executes on button press in radio1.
function radio1_Callback(hObject, eventdata, handles)
global A X Y Z R N;
X=A(1:N);
R=X+Y+Z;
set(handles.play4,'Enable','on');
set(handles.stop4,'Enable','on');
set(handles.amp4,'Enable','on');

% --- Executes on button press in radio2.
function radio2_Callback(hObject, eventdata, handles)
global B N X Z R Y;
Y=B(1:N);
R=X+Y+Z;
set(handles.play4,'Enable','on');
set(handles.stop4,'Enable','on');
set(handles.amp4,'Enable','on');

% --- Executes on button press in radio3.
function radio3_Callback(hObject, eventdata, handles)
global C N Y X R Z;
Z=C(1:N);
R=X+Y+Z;
set(handles.play4,'Enable','on');
set(handles.stop4,'Enable','on');
set(handles.amp4,'Enable','on');

% --- Executes on button press in play4.
function play4_Callback(hObject, eventdata, handles)
global R;
sound(R,44100);
plot(handles.plot4,R);

% --- Executes on button press in stop4.
function stop4_Callback(hObject, eventdata, handles)
clear sound;

% --- Executes on button press in amp4.
function amp4_Callback(hObject, eventdata, handles)
clear sound;
global X Y Z R current4;
R=X+Y+Z;
current4=current4*2;
R=R*current4;
set(handles.amp4,'String',num2str(current4));
guidata(hObject,handles);

% --- Executes on button press in reset4.
function reset4_Callback(hObject, eventdata, handles)
clear sound;
global X Y Z R N current4;
current4=1;
set(handles.amp4,'String','Amplify');
set(handles.radio1,'Value',0.0);
set(handles.radio3,'Value',0.0);
set(handles.radio2,'Value',0.0);
X=zeros(N,1);
Y=zeros(N,1);
Z=zeros(N,1);
R=X+Y+Z;
plot(handles.plot4,0);


% --- Executes during object creation, after setting all properties.
function plot1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plot2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate plot2


% --- Executes during object creation, after setting all properties.
function plot2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plot2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate plot2


% --- Executes during object creation, after setting all properties.
function plot3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plot3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate plot3


% --- Executes during object creation, after setting all properties.
function plot4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plot4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate plot4

% --- Executes during object deletion, before destroying properties.
function plot1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to plot2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes during object deletion, before destroying properties.
function plot2_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to plot2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object deletion, before destroying properties.
function plot3_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to plot3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object deletion, before destroying properties.
function plot4_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to plot4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over radio1.
function radio1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to radio1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over radio2.
function radio2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to radio2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over radio3.
function radio3_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to radio3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
