package com.javalec.domain;

public final class ExampleSequence { // DB Sequence 쓰는 게 나은데, 만약 애플리케이션 레벨에서 해결해야 한다면.
	// static 자원 -> 여러 곳에 공유되면 언제 어디서 어떻게 바뀔지 몰라서 -> 동시성 문제가 있을 수 있고, 최적화도 안 좋음.
	// => instance(null이 아닌 객체) 하나를 만들어서 -> 모든 곳에서 이 인스턴스를 사용하도록. 동시성 관리는 인스턴스 내에서 다 가능.
	
	public static ExampleSequence getInstance() {
		return ExampleSequenceHolder.INSTANCE;
	}
	
	private int sequence;

	private ExampleSequence() {} // prevent usage
	
	public int current() {
		return sequence;
	}
	
	public synchronized int next() { // synchronized가 있으면: 여러 곳에서 동시에 실행할 수 없도록. 이 함수는 절대적으로 호출에 대한 동시성 보장.
		sequence = sequence + 1; // (synchronized 없었다면) 여기 실행될 때 다른 스레드들도 여기를 계속 실행하고 있을 수도 있어서
		return sequence; // (synchronized 없었다면) 여기까지 오면 단순히 1만 증가한 게 아닐 수도 있음. (+여러 스레드가 동일한 결과를 받아 버릴 수도.)
	}
	
	// 스레드 세이프한 싱글톤 객체 생성
	private static class ExampleSequenceHolder { // 클래스 로드 타임은 원래 자바가 동시성에 대해서 완전히 보장해 주기 때문에.
		// 내부 클래스의 로드 타임에 인스턴스가 생성되게 함으로써 인스턴스 중복 생성 방지
		private static final ExampleSequence INSTANCE = new ExampleSequence();
	}
}
