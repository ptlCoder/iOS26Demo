//
//  SwiftUIView.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/1/14.
//

import SwiftUI
import WebKit

struct ProfileViewSwiftUI: View {
    
    var userId: String
    var onClose: ((String)->Void)?
    var isLogin:  Bool = true
    
    @State private var text = ""
    @State private var password = ""
    
    
    
    enum Field {
        case username, password
    }
    @FocusState private var focus: Field?

    @State var value = 0
    
    
    enum ExampleSegment: String, CaseIterable, Identifiable {
        case first = "First"
        case second = "Second"
        case three = "Three"
        case four = "Four"
        var id: Self { self }
    }
    
    @State private var selected: ExampleSegment = .first
    @State private var selection = 0
    
    
    var body: some View {
        
        
        
        CustomSegmentedControl(
            items: [
                .init(title: "Home", systemImage: "house"),
                .init(title: "Star", systemImage: "star"),
                .init(title: "Profile", systemImage: "person")
            ],
            selection: $selection
        )
        .padding()
        
//        Picker("Options", selection: $selected) {
//            ForEach(ExampleSegment.allCases) { option in
//                Text(option.rawValue).tag(option)
//            }
//        }.pickerStyle(.segmented)
//            .padding()
//            
//        Text("选中：\(self.selected.rawValue)")
//        
//        HStack {
//            
//            Stepper(value: $value, step: 2) {
//                Text("Stepper value: \(self.value)")
//            } onEditingChanged: { c in
//                print(c)
//            }.padding(50)
//
//        }.navigationTitle("Stepper")
//        
//        TextField("用户名", text: $text)
//            .padding(10)
//            .font(.system(size: 16))
//            .foregroundStyle(.primary)
//            .background(
//                RoundedRectangle(cornerRadius: 10)
//                        .fill(Color.gray.opacity(0.15))
//            )
//            .frame(width: 220, height: 44)
//            .tint(.red) // 光标颜色
//            .submitLabel(.`return`)
//            .onSubmit {
//                print("---onSubmit-----")
//                focus = .password // 密码聚焦
//            }
//            .focused($focus, equals: .username)
//        
//        SecureField("密码", text: $password)
//            .focused($focus, equals: .password)
        
//        // 左上角
//        VStack {
//            HStack {
//                Text("标题")
//                    .font(.system(size: 16, weight: .medium))
//                    .padding(.leading, 10)
//                    .padding(.top, 15)
//                Spacer()
//            }
//            Spacer()
//        }
        
        // 中下
//        VStack {
//            Spacer()
//            Button("点击") {
//                
//            }.padding(.bottom, 10)
//        }
//        
//        // 左下
//        VStack {
//            Spacer()
//            HStack {
//                Button("点击") {}
//                    .padding(.leading, 20)
//                    .padding(.bottom, 20)
//                Spacer()
//            }
//        }
//        
//        // 右下
//        VStack {
//            Spacer()
//            HStack {
//                Spacer()
//                Button("点击") {}
//                    .padding(.trailing, 10)
//                    .padding(.bottom, 20)
//            }
//        }
        
//        HStack{
//            Text("左")
//            Spacer()
//            Text("右")
//        }
        
//        VStack {
//            Spacer()
//            HStack{
//                Text("左")
//                Spacer()
//                Text("右")
//            }
//        }
        
//        VStack {
//            HStack{
//                Text("左")
//                Spacer()
//                Text("右")
//            }
//            Spacer()
//        }
        
//        VStack {
//            HStack{
//                Text("左")
//                Spacer()
//                Text("中")
//                Spacer()
//                Text("右")
//            }
//            Spacer()
//        }
        
//        HStack {
//            Spacer()
//            Image(systemName: "checkmark")
//            Text("name")
//            Spacer()
//        }
//        .frame(height: 60)
//        .padding(.horizontal, 20)
////        .background(Color.white)
//        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
//        .overlay(
//            RoundedRectangle(cornerRadius: 8, style: .continuous)
//                .stroke(Color.blue, lineWidth: 1)
//        )
    }
}


struct CustomSegmentedControl: View {
    
    struct Item: Identifiable {
        let id = UUID()
        let title: String
        let systemImage: String
    }
    
    let items: [Item]
    @Binding var selection: Int
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                Button {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        selection = index
                    }
                } label: {
                    VStack(spacing: 4) {
                        Image(systemName: item.systemImage)
                            .font(selection == index ? .system(size: 18, weight: .bold) : .system(size: 16))
                        
                        Text(item.title)
                            .font(selection == index ? .system(size: 15, weight: .semibold)
                                                     : .system(size: 13))
                    }
                    .foregroundColor(selection == index ? .white : .gray)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .background(
                        ZStack {
                            if selection == index {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.blue)
                                    .matchedGeometryEffect(id: "bg", in: namespace)
                            }
                        }
                    )
                }
                .buttonStyle(.plain)
            }
        }
        .padding(4)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.gray.opacity(0.15))
        )
    }
    
    @Namespace private var namespace
}

//
//struct WebViewPage : UIViewRepresentable {
//    
//    func makeUIView(context: Context) -> some WKWebView {
//        return WKWebView()
//    }
//    
//    func updateUIView(_ uiView: WKWebView, context: Context) {
//        let req = URLRequest(url: URL(string: "https://www.apple.com")!)
//        uiView.load(req)
//    }
//    
//}
