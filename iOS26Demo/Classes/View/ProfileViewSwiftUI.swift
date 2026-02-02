//
//  SwiftUIView.swift
//  iOS26Demo
//
//  Created by 岸涌科技 on 2026/1/14.
//

import SwiftUI

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

    var body: some View {
        
        TextField("用户名", text: $text)
            .padding(10)
            .font(.system(size: 16))
            .foregroundStyle(.primary)
            .background(
                RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.15))
            )
            .frame(width: 220, height: 44)
            .tint(.red) // 光标颜色
            .submitLabel(.`return`)
            .onSubmit {
                print("---onSubmit-----")
                focus = .password // 密码聚焦
            }
            .focused($focus, equals: .username)
        
        SecureField("密码", text: $password)
            .focused($focus, equals: .password)
        
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
