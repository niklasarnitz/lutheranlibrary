\version "2.24.3"
% Lochner, Brandenburg-Nürnbergische Weise. PDF scan 276, printed p. 251.
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper {
  paper-width = 150\mm left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f page-breaking = #ly:one-page-breaking
}
global = { \key f \major \accidentalStyle forget \omit Staff.TimeSignature \cadenzaOn }
\score {
  \new StaffGroup <<
    \new Staff <<
      \clef treble \global
      \new Voice = "melody" { a'1 a'1 g'1 bes'1 g'1 f'\breve \bar "|" g'1 a'1 g'1 f'1( g'1) bes'1 s2 a'1( g'1 a'1) g'\breve \bar "|" a'1 bes'1 }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t der du bist im Him -- "mel." Ge -- hei -- ligt werd \skip 1 dein Na -- \skip 1 \skip 1 "me." Zu -- komm }
    \new PianoStaff <<
      \new Staff { \clef treble \global r1 r1 r1 <f' bes'>1 <e' g'>1 <c' f'>\breve \bar "|" r1 r1 r1 r1 r2 f'2 <d' bes'>1 g'2 <d' fis' a'>1( <bes g'>1 <d' fis'! a'>1) <d' g'>\breve \bar "|" <c' f' a'>1 <d' f' bes'>1 }
      \new Staff { \clef bass \global r1 r1 r1 <bes, d'>1 <c c'>1 <f a bes>\breve \bar "|" r1 r1 r1 r1 r1 bes,1 s2 d\breve~ d1 <f a bes>\breve \bar "|" f1 bes,1 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
