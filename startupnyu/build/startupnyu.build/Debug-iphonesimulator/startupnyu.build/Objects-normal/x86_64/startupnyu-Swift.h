// Generated by Apple Swift version 2.2 (swiftlang-703.0.18.8 clang-703.0.31)
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
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
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
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UILabel;
@class NSCoder;

SWIFT_CLASS("_TtC10startupnyu22AddButtonTableViewCell")
@interface AddButtonTableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified addLabel;
- (void)awakeFromNib;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIWindow;
@class UIApplication;
@class NSObject;

SWIFT_CLASS("_TtC10startupnyu11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow * _Nullable window;
- (BOOL)application:(UIApplication * _Nonnull)application didFinishLaunchingWithOptions:(NSDictionary * _Nullable)launchOptions;
- (void)applicationWillResignActive:(UIApplication * _Nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * _Nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * _Nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * _Nonnull)application;
- (void)applicationWillTerminate:(UIApplication * _Nonnull)application;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class UIImagePickerController;
@class UIButton;
@class UIImageView;
@class UITextField;
@class UITextView;
@class NSBundle;

SWIFT_CLASS("_TtC10startupnyu27CreateProjectViewController")
@interface CreateProjectViewController : UITableViewController <UIImagePickerControllerDelegate>
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified projectImageView;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified projectName;
@property (nonatomic, weak) IBOutlet UITextView * _Null_unspecified aboutTextField;
@property (nonatomic, weak) IBOutlet UITextView * _Null_unspecified requirementsTextField;
@property (nonatomic, readonly, strong) UIImagePickerController * _Nonnull imagePicker;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (IBAction)uploadImageTapped:(UIButton * _Nonnull)sender;
- (IBAction)cancelButtonTapped:(id _Nonnull)sender;
- (IBAction)saveButtonTapped:(UIButton * _Nonnull)sender;
- (IBAction)cancelButton:(UIButton * _Nonnull)sender;
- (void)imagePickerController:(UIImagePickerController * _Nonnull)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *, id> * _Nonnull)info;
- (void)imagePickerControllerDidCancel:(UIImagePickerController * _Nonnull)picker;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10startupnyu12CustomTabbar")
@interface CustomTabbar : UITabBarController
- (void)viewDidLoad;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIBarButtonItem;

SWIFT_CLASS("_TtC10startupnyu35EditProfileTableTableViewController")
@interface EditProfileTableTableViewController : UITableViewController
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified profileImageView;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified nameTextField;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified titleTextField;
@property (nonatomic, weak) IBOutlet UITextView * _Null_unspecified bioTextField;
- (void)viewDidLoad;
- (IBAction)uploadProfileImageButtonTapped:(UIButton * _Nonnull)sender;
- (IBAction)cancelButtonTapped:(UIBarButtonItem * _Nonnull)sender;
- (IBAction)saveButtonTapped:(UIBarButtonItem * _Nonnull)sender;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UITableView;
@class NSIndexPath;
@class UIStoryboardSegue;

SWIFT_CLASS("_TtC10startupnyu9ExploreVC")
@interface ExploreVC : UIViewController <UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView * _Null_unspecified tableView;
- (void)viewDidLoad;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10startupnyu7LoginVC")
@interface LoginVC : UIViewController
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10startupnyu19LoginViewController")
@interface LoginViewController : UIViewController
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified username;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified password;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (IBAction)LoginButton:(UIButton * _Nonnull)sender;
- (IBAction)unwindTologinup:(UIStoryboardSegue * _Nonnull)segue;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10startupnyu19MessageListViewCell")
@interface MessageListViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified nameLabel;
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified senderProfileImage;
- (void)awakeFromNib;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10startupnyu15MessageViewCell")
@interface MessageViewCell : UITableViewCell
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10startupnyu26MessagesListViewController")
@interface MessagesListViewController : UIViewController <UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UISegmentedControl;
@class UISwipeGestureRecognizer;

SWIFT_CLASS("_TtC10startupnyu28MyProjectTableViewController")
@interface MyProjectTableViewController : UITableViewController
@property (nonatomic, copy) NSString * _Nonnull projectName;
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified projectImage;
@property (nonatomic, weak) IBOutlet UISegmentedControl * _Null_unspecified segmentControl;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified projectDescriptionLabel;
- (void)viewDidLoad;
- (IBAction)segmentControlTapped:(UISegmentedControl * _Nonnull)sender;
- (void)handleSwipes:(UISwipeGestureRecognizer * _Nonnull)sender;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10startupnyu23MyProjectsTableViewCell")
@interface MyProjectsTableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified projectName;
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified projectImage;
- (void)awakeFromNib;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10startupnyu5NavVC")
@interface NavVC : UINavigationController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNavigationBarClass:(Class _Nullable)navigationBarClass toolbarClass:(Class _Nullable)toolbarClass OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithRootViewController:(UIViewController * _Nonnull)rootViewController OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10startupnyu21ProfileViewController")
@interface ProfileViewController : UITableViewController
@property (nonatomic, weak) IBOutlet UIBarButtonItem * _Null_unspecified settingsButton;
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified profileImageView;
@property (nonatomic, weak) IBOutlet UISegmentedControl * _Null_unspecified segmentView;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified userInformationLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified fullnameLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified onelineDescriptionLabel;
@property (nonatomic, copy) NSString * _Nonnull bio;
@property (nonatomic, copy) NSString * _Nonnull links;
@property (nonatomic, copy) NSString * _Nonnull skills;
@property (nonatomic, copy) NSString * _Nonnull fullName;
@property (nonatomic, copy) NSString * _Nonnull oneLineDescription;
- (void)viewDidLoad;
- (IBAction)segmentTapped:(UISegmentedControl * _Nonnull)sender;
- (void)btnClicked;
- (IBAction)unwindToProfileView:(UIStoryboardSegue * _Nonnull)segue;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10startupnyu11ProjectCell")
@interface ProjectCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified projectImage;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified projectName;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified projectDesc;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10startupnyu26ProjectTableViewController")
@interface ProjectTableViewController : UITableViewController
@property (nonatomic, copy) NSString * _Nonnull projectName;
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified projectImage;
@property (nonatomic, weak) IBOutlet UISegmentedControl * _Null_unspecified segmentControl;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified projectDescriptionLabel;
- (void)viewDidLoad;
- (IBAction)segmentControlTapped:(UISegmentedControl * _Nonnull)sender;
- (void)handleSwipes:(UISwipeGestureRecognizer * _Nonnull)sender;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10startupnyu26ProjectsListViewController")
@interface ProjectsListViewController : UIViewController <UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView * _Null_unspecified tableView;
- (void)viewDidAppear:(BOOL)animated;
- (void)viewDidLoad;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10startupnyu28SettingsNavigationController")
@interface SettingsNavigationController : UINavigationController
- (nonnull instancetype)initWithNavigationBarClass:(Class _Nullable)navigationBarClass toolbarClass:(Class _Nullable)toolbarClass OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithRootViewController:(UIViewController * _Nonnull)rootViewController OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10startupnyu21SettingsViewContoller")
@interface SettingsViewContoller : UITableViewController
- (IBAction)logoutButton:(UIButton * _Nonnull)sender;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC10startupnyu8SignupVC")
@interface SignupVC : UIViewController
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified nameTextField;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified passwordTextField;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified confirmPasswordTextField;
- (void)viewDidLoad;
- (void)viewDidAppear:(BOOL)animated;
- (IBAction)DoneButtonTapped:(UIButton * _Nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UITouch;
@class UIEvent;
@class NSLayoutConstraint;
@class UIView;

SWIFT_CLASS("_TtC10startupnyu22messagesViewController")
@interface messagesViewController : UIViewController <UIScrollViewDelegate, UITableViewDelegate, UITextFieldDelegate, UITableViewDataSource>
@property (nonatomic, weak) IBOutlet NSLayoutConstraint * _Null_unspecified messageDockConstraint;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified messageTextBox;
@property (nonatomic, weak) IBOutlet UIView * _Null_unspecified dockView;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified sendButton;
- (void)viewDidLoad;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (IBAction)sendButtonTapped:(UIButton * _Nonnull)sender;
- (void)textFieldDidBeginEditing:(UITextField * _Nonnull)textField;
- (void)textFieldDidEndEditing:(UITextField * _Nonnull)textField;
- (void)touchesBegan:(NSSet<UITouch *> * _Nonnull)touches withEvent:(UIEvent * _Nullable)event;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

#pragma clang diagnostic pop
