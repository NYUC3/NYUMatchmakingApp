// Generated by Apple Swift version 3.0.1 (swiftlang-800.0.58.6 clang-800.0.42.1)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if defined(__has_include) && __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if defined(__has_attribute) && __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
# if defined(__has_feature) && __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import CoreGraphics;
@import Foundation;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class AKImageCropperView;
@class NSCoder;

SWIFT_CLASS("_TtC7Project25AKImageCropperOverlayView")
@interface AKImageCropperOverlayView : UIView
/**
  Superview
*/
@property (nonatomic, strong) AKImageCropperView * _Null_unspecified croppperView;
@property (nonatomic, readonly) CGFloat cornerOffset;
@property (nonatomic, readonly) CGSize cornerSize;
- (void)drawRect:(CGRect)rect;
- (void)overlayViewDrawBg:(CGRect)rect;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIGestureRecognizer;
@class AKImageCropperTouchView;

SWIFT_CLASS("_TtC7Project23AKImageCropperScollView")
@interface AKImageCropperScollView : UIScrollView
@property (nonatomic, weak) AKImageCropperTouchView * _Null_unspecified sender;
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer * _Nonnull)gestureRecognizer;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@protocol AKImageCropperTouchViewDelegate;

SWIFT_CLASS("_TtC7Project23AKImageCropperTouchView")
@interface AKImageCropperTouchView : UIView
/**
  Superview
*/
@property (nonatomic, strong) AKImageCropperView * _Null_unspecified cropperView;
/**
  Translation receiver (AKImageCropperScollView)
*/
@property (nonatomic, weak) UIView * _Null_unspecified receiver;
@property (nonatomic, readonly) CGFloat fingerSize;
@property (nonatomic, readonly) CGSize fingerCornerSize;
@property (nonatomic, readonly) CGRect cropRect;
@property (nonatomic, readonly) CGSize cropRectMinSize;
@property (nonatomic) BOOL flagScrollViewGesture;
@property (nonatomic, weak) id <AKImageCropperTouchViewDelegate> _Nullable delegate;
- (void)drawRect:(CGRect)rect;
- (CGRect)topLeftCorner;
- (CGRect)topRightCorner;
- (CGRect)bottomLeftCorner;
- (CGRect)bottomRightCorner;
- (CGRect)topEdgeRect;
- (CGRect)bottomEdgeRect;
- (CGRect)rightEdgeRect;
- (CGRect)leftEdgeRect;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIEvent;

@interface AKImageCropperTouchView (SWIFT_EXTENSION(Project))
- (UIView * _Nullable)hitTest:(CGPoint)point withEvent:(UIEvent * _Nullable)event;
@end

@class UITouch;

@interface AKImageCropperTouchView (SWIFT_EXTENSION(Project))
- (void)touchesBegan:(NSSet<UITouch *> * _Nonnull)touches withEvent:(UIEvent * _Nullable)event;
- (void)touchesMoved:(NSSet<UITouch *> * _Nonnull)touches withEvent:(UIEvent * _Nullable)event;
- (void)touchesEnded:(NSSet<UITouch *> * _Nonnull)touches withEvent:(UIEvent * _Nullable)event;
@end


SWIFT_PROTOCOL("_TtP7Project31AKImageCropperTouchViewDelegate_")
@protocol AKImageCropperTouchViewDelegate
@optional
- (void)cropRectChanged:(CGRect)rect;
- (BOOL)blockScrollViewGestures;
@end

@class UIImage;
@class UIColor;
@class UIImageView;
@protocol AKImageCropperViewDelegate;

SWIFT_CLASS("_TtC7Project18AKImageCropperView")
@interface AKImageCropperView : UIView
@property (nonatomic, strong) UIImage * _Null_unspecified image;
@property (nonatomic, readonly) CGRect cropRect;
@property (nonatomic, readonly) CGRect cropRectTranslatedToImage;
@property (nonatomic) CGSize cropRectMinSize;
@property (nonatomic, readonly) BOOL overlayViewIsActive;
@property (nonatomic, weak) id <AKImageCropperViewDelegate> _Nullable delegate;
@property (nonatomic) NSTimeInterval overlayViewAnimationDuration;
@property (nonatomic) UIViewAnimationOptions overlayViewAnimationOptions;
@property (nonatomic) NSInteger fingerSize;
@property (nonatomic) NSInteger cornerOffset;
@property (nonatomic) CGSize cornerSize;
@property (nonatomic) BOOL grid;
@property (nonatomic) NSInteger gridLines;
@property (nonatomic, strong) UIColor * _Nonnull overlayColor;
@property (nonatomic, strong) UIColor * _Nonnull strokeColor;
@property (nonatomic, strong) UIColor * _Nonnull cornerColor;
@property (nonatomic, strong) UIColor * _Nonnull gridColor;
@property (nonatomic, readonly, strong) AKImageCropperScollView * _Null_unspecified scrollView;
@property (nonatomic, readonly, strong) UIImageView * _Null_unspecified imageView;
- (nonnull instancetype)initWithFrame:(CGRect)frame image:(UIImage * _Nonnull)image showOverlayView:(BOOL)showOverlayView OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithImage:(UIImage * _Nonnull)image showOverlayView:(BOOL)showOverlayView OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)refresh;
- (void)destroy;
- (void)setCropRect:(CGRect)rect;
- (void)dismissOverlayViewAnimated:(BOOL)flag completion:(void (^ _Nullable)(void))completion;
- (UIImage * _Nonnull)croppedImage;
- (nonnull instancetype)initWithFrame:(CGRect)frame SWIFT_UNAVAILABLE;
@end


@interface AKImageCropperView (SWIFT_EXTENSION(Project)) <UIScrollViewDelegate>
- (UIView * _Nullable)viewForZoomingInScrollView:(UIScrollView * _Nonnull)scrollView;
@end


@interface AKImageCropperView (SWIFT_EXTENSION(Project)) <AKImageCropperTouchViewDelegate>
- (void)cropRectChanged:(CGRect)rect;
@end


SWIFT_PROTOCOL("_TtP7Project26AKImageCropperViewDelegate_")
@protocol AKImageCropperViewDelegate
@optional
- (void)cropRectChanged:(CGRect)rect;
- (void)overlayViewDrawInTopLeftCropRectCornerPoint:(CGPoint)point;
- (void)overlayViewDrawInTopRightCropRectCornerPoint:(CGPoint)point;
- (void)overlayViewDrawInBottomRightCropRectCornerPoint:(CGPoint)point;
- (void)overlayViewDrawInBottomLeftCropRectCornerPoint:(CGPoint)point;
- (void)overlayViewDrawStrokeInCropRect:(CGRect)cropRect;
- (void)overlayViewDrawGridInCropRect:(CGRect)cropRect;
@end


@interface AKImageCropperView (SWIFT_EXTENSION(Project)) <AKImageCropperViewDelegate>
- (void)overlayViewDrawInTopLeftCropRectCornerPoint:(CGPoint)point;
- (void)overlayViewDrawInTopRightCropRectCornerPoint:(CGPoint)point;
- (void)overlayViewDrawInBottomRightCropRectCornerPoint:(CGPoint)point;
- (void)overlayViewDrawInBottomLeftCropRectCornerPoint:(CGPoint)point;
- (void)overlayViewDrawStrokeInCropRect:(CGRect)cropRect;
- (void)overlayViewDrawGridInCropRect:(CGRect)cropRect;
@end


@class UITableView;
@class UITableViewCell;
@class NSBundle;

SWIFT_CLASS("_TtC7Project13AddActivityVC")
@interface AddActivityVC : UIViewController <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) IBOutlet UITableView * _Null_unspecified theTableView;
- (void)viewDidAppear:(BOOL)animated;
- (void)viewDidLoad;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIWindow;
@class UIApplication;

SWIFT_CLASS("_TtC7Project11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow * _Nullable window;
- (BOOL)application:(UIApplication * _Nonnull)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey, id> * _Nullable)launchOptions;
- (void)applicationWillResignActive:(UIApplication * _Nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * _Nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * _Nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * _Nonnull)application;
- (void)applicationWillTerminate:(UIApplication * _Nonnull)application;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class UIImagePickerController;
@class UIBarButtonItem;
@class UIButton;
@class UIPickerView;
@class UITextField;

SWIFT_CLASS("_TtC7Project19CreateNewActivityVC")
@interface CreateNewActivityVC : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified activityLabel;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified actvityDescription;
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified feedUploadImage;
@property (nonatomic, weak) IBOutlet UIPickerView * _Null_unspecified projectNamePickerView;
@property (nonatomic, readonly, strong) UIImagePickerController * _Nonnull imagePicker;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull projectNames;
@property (nonatomic, copy) NSString * _Nonnull selectedProjectName;
- (void)viewDidLoad;
- (IBAction)cancelButtonTapped:(UIBarButtonItem * _Nonnull)sender;
- (IBAction)saveButtonTapped:(UIBarButtonItem * _Nonnull)sender;
- (IBAction)uploadButton:(UIButton * _Nonnull)sender;
- (void)imagePickerController:(UIImagePickerController * _Nonnull)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *, id> * _Nonnull)info;
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView * _Nonnull)pickerView;
- (NSInteger)pickerView:(UIPickerView * _Nonnull)pickerView numberOfRowsInComponent:(NSInteger)component;
- (NSString * _Nullable)pickerView:(UIPickerView * _Nonnull)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
- (void)pickerView:(UIPickerView * _Nonnull)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
- (void)touchesBegan:(NSSet<UITouch *> * _Nonnull)touches withEvent:(UIEvent * _Nullable)event;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC7Project15CreateProjectVC")
@interface CreateProjectVC : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified projectImageView;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified projectNameTextField;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified projectDescriptionTextfield;
@property (nonatomic, readonly, strong) UIImagePickerController * _Nonnull imagePicker;
- (void)viewDidLoad;
- (IBAction)saveButtonTapped:(UIBarButtonItem * _Nonnull)sender;
- (IBAction)cancelButtonTapped:(UIBarButtonItem * _Nonnull)sender;
- (IBAction)uploadButtonTapped:(UIButton * _Nonnull)sender;
- (void)imagePickerController:(UIImagePickerController * _Nonnull)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *, id> * _Nonnull)info;
- (void)touchesBegan:(NSSet<UITouch *> * _Nonnull)touches withEvent:(UIEvent * _Nullable)event;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC7Project23CropImageViewController")
@interface CropImageViewController : UIViewController
@property (nonatomic, strong) AKImageCropperView * _Null_unspecified cropView;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC7Project22CropTestViewController")
@interface CropTestViewController : UIViewController
@property (nonatomic, strong) AKImageCropperView * _Null_unspecified cropView;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC7Project14CustomTabbarVC")
@interface CustomTabbarVC : UITabBarController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIStoryboardSegue;

SWIFT_CLASS("_TtC7Project6FeedVC")
@interface FeedVC : UIViewController <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull projectsFollowing;
@property (nonatomic, strong) UIView * _Nullable overlay;
@property (nonatomic, weak) IBOutlet UITableView * _Null_unspecified daTableView;
- (void)viewDidLoad;
- (void)queryActivitiesWithName:(NSString * _Nonnull)name;
- (NSString * _Nonnull)processTimestampWithStr:(NSString * _Nonnull)str;
- (void)viewDidAppear:(BOOL)animated;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)buttonClickedWithSender:(UIButton * _Nonnull)sender;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UILabel;

SWIFT_CLASS("_TtC7Project19FeedVCTableViewCell")
@interface FeedVCTableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified feedImage;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified projectNameLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified feedTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified feedDescriptionLabel;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified likeButton;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified noOfLikes;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified timeStampLabel;
- (void)awakeFromNib;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC7Project19HomeVCTableViewCell")
@interface HomeVCTableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified projectImage;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified projectName;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified descriptionLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified followersLabel;
- (void)awakeFromNib;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC7Project18HomeViewController")
@interface HomeViewController : UIViewController <UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UIView * _Nullable overlay;
@property (nonatomic, weak) IBOutlet UITableView * _Null_unspecified projectTableView;
- (void)viewDidLoad;
- (void)viewDidAppear:(BOOL)animated;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (IBAction)unwindToProjectsListWithSegue:(UIStoryboardSegue * _Nonnull)segue;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC7Project7LoginVC")
@interface LoginVC : UIViewController
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified email;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified password;
- (void)viewDidLoad;
- (IBAction)LoginTapped:(UIButton * _Nonnull)sender;
- (IBAction)unwindToLoginWithSegue:(UIStoryboardSegue * _Nonnull)segue;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC7Project10MyFeedCell")
@interface MyFeedCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified myFeedImageView;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified myProjectLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified myTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified myActivityDiscription;
- (void)awakeFromNib;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC7Project8MyFeedVC")
@interface MyFeedVC : UIViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC7Project17NavViewController")
@interface NavViewController : UINavigationController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNavigationBarClass:(Class _Nullable)navigationBarClass toolbarClass:(Class _Nullable)toolbarClass OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithRootViewController:(UIViewController * _Nonnull)rootViewController OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC7Project21ProjectViewController")
@interface ProjectViewController : UIViewController <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified projectImage;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified projectDescription;
@property (nonatomic, weak) IBOutlet UIBarButtonItem * _Null_unspecified followButton;
@property (nonatomic) BOOL isFollowing;
- (void)viewDidLoad;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (IBAction)followTapped:(UIBarButtonItem * _Nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC7Project14ProjectsListVC")
@interface ProjectsListVC : UIViewController <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified emailLabel;
@property (nonatomic, weak) IBOutlet UITableView * _Null_unspecified projectsTable;
- (void)viewDidLoad;
- (IBAction)unwindToProjectsWithSegue:(UIStoryboardSegue * _Nonnull)segue;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC7Project22SettingsViewController")
@interface SettingsViewController : UIViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (IBAction)logoutTapped:(UIButton * _Nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC7Project8SignupVC")
@interface SignupVC : UIViewController
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified email;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified password;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified confirmpassword;
- (void)viewDidLoad;
- (IBAction)SignupTappd:(UIButton * _Nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC7Project16SingleActivityVC")
@interface SingleActivityVC : UIViewController
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified activityTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified activityDescriptionLabel;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified likeButton;
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified activityImage;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified likesLabel;
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified backButton;
- (void)viewDidLoad;
- (void)viewDidAppear:(BOOL)animated;
- (IBAction)likeButtonTapped:(UIButton * _Nonnull)sender;
- (IBAction)backButtonTapped:(UIBarButtonItem * _Nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC7Project22TesttOneViewController")
@interface TesttOneViewController : UIViewController <UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull list;
- (void)viewDidLoad;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


@interface UIColor (SWIFT_EXTENSION(Project))
/**
  Convert RGBA value to HEX
  Usage:
  UIColor(red: 1, green: 0.8, blue: 0.6, alpha: 0.2).toHex() // #FFCC9933
  UIColor(red: 1, green: 0.8, blue: 0.6, alpha: 1).toHex() // #FFCC99
*/
- (NSString * _Nonnull)toHex;
/**
  Convert HEX value to RGBA
  Supported single and multiple HEX character. Supported lowercase and uppercase HEX characters
  Default value for alpha is 1
  Usage:
  var rgba = UIColor().fromHex(hex: “#FC9”) // UIColor(red: 1.0, green: 0.8, blue: 0.6, alpha: 1)
  var rgba = UIColor().fromHex(hex: “#FFCC99”) // UIColor(red: 1.0, green: 0.8, blue: 0.6, alpha: 1)
  var rgba = UIColor().fromHex(hex: “#FC93”) // UIColor(red: 1.0, green: 0.8, blue: 0.6, alpha: 0.2)
  var rgba = UIColor().fromHex(hex: “#FFCC9933”) // UIColor(red: 1.0, green: 0.8, blue: 0.6, alpha: 0.2)
*/
- (UIColor * _Null_unspecified)fromHexWithHex:(NSString * _Nonnull)hex;
@end


@interface UIImage (SWIFT_EXTENSION(Project))
/**
  Crop image from self
  Usage:
  var img = image.getImageInRect(CGRectMake(50,50,150,150))
*/
- (UIImage * _Nonnull)getImageInRect:(CGRect)rect;
@end

#pragma clang diagnostic pop
