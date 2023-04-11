import XCTest
import SnapshotTesting
@testable import DesignSystem

final class design_systemTests: XCTestCase {
    override func setUp() {
        super.setUp()
        UIFont.registerFonts()
        isRecording = false
    }
    
    func test_button() {
        let button = PrimaryButton(title: "Button Label", edgesInset: .xs)

        let result = verifySnapshot(matching: button, as: .image)

        XCTAssertNil(result)
    }
    
    func test_button_selected() {
        let button = PrimaryButton(title: "Button Label", edgesInset: .xs)
        button.isSelected = true

        let result = verifySnapshot(matching: button, as: .image)

        XCTAssertNil(result)
    }
    
    func test_label_heading_sm() {
        let frame = CGRect(x: 0, y: 0, width: 184, height: 48)
        let label = BaseLabel(text: "Heading SM", style: .headingSmall)
        label.frame = frame
        
        let result = verifySnapshot(matching: label, as: .image)

        XCTAssertNil(result)
    }
    
    func test_label_paragraph() {
        let frame = CGRect(x: 0, y: 0, width: 371, height: 350)
        let label = BaseLabel(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", style: .paragraph)
        label.frame = frame
        
        let result = verifySnapshot(matching: label, as: .image)

        XCTAssertNil(result)
    }
    
    func test_label_subtitle_small() {
        let frame = CGRect(x: 0, y: 0, width: 128, height: 26)
        let label = BaseLabel(text: "Subtitle SM", style: .subtitleSmall)
        label.frame = frame
        
        let result = verifySnapshot(matching: label, as: .image)

        XCTAssertNil(result)
    }
    
    func test_shape() {
        let frame = CGRect(x: 0, y: 0, width: 300, height: 427)
        let view = Shape(borderWidht: .thin,
                         borderColor: NeutralColors.color2,
                         backgroundColor: NeutralColors.color1,
                         edgesInset: .sm)
        view.frame = frame
        
        let result = verifySnapshot(matching: view, as: .image)

        XCTAssertNil(result)
    }
    
    func test_CardContent() {
        let frame = CGRect(x: 0, y: 0, width: 357, height: 650)
        let view = CardContent()
        view.frame = frame
        
        let result = verifySnapshot(matching: view, as: .image)

        XCTAssertNil(result)
    }
}
